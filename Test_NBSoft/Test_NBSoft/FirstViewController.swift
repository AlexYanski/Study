//
//  FirstViewController.swift
//  Test_NBSoft
//
//  Created by Alexandr Yanski on 04.11.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

var managedObjectContext: NSManagedObjectContext!

class FirstViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var myLocationLabel: UILabel!
    @IBOutlet weak var myAddressLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    
    let geocoder = CLGeocoder()
    
    var cityName: String?
    var countryName: String?
    var streetName: String?
    
    var temperature: Int16?
    var icon: String?
    
    var myLatitude: Double?
    var myLongitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        startLocationManager()
                
        temperatureLabel.isHidden = true
        summaryLabel.isHidden = true
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func stopLocationManager() {
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocatuion = locations.last!
        
        if latestLocatuion.horizontalAccuracy < 0 {
            return
        }
        
        if location == nil || location!.horizontalAccuracy > latestLocatuion.horizontalAccuracy {
            
            location = latestLocatuion
            stopLocationManager()
            
            let cordinateSpan: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
            let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
            let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, cordinateSpan)
            
            myLatitude = location?.coordinate.latitude
            myLongitude = location?.coordinate.longitude
            
            
            
            geocoder.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) in
                if error != nil {
                    print("Error: " + error!.localizedDescription)
                    return
                }
                
                if placemarks!.count > 0 {
                    var addressString: String = ""
                    let placeMark = placemarks![0] as CLPlacemark
                    
                    
                    
                    if let country = placeMark.country, placeMark.country != nil {
                        self.countryName = country
                        addressString = addressString + self.countryName! + "  "
                    }
                    
                    if let city = placeMark.locality, placeMark.locality != nil {
                        self.cityName = city
                        addressString = addressString + self.cityName! + "  "
                    }
                    
                    if let street = placeMark.thoroughfare, placeMark.thoroughfare != nil {
                        self.streetName = street
                        addressString = addressString + self.streetName!
                    }
                   
                    self.myAddressLabel.text = addressString
                }
                
            })

            
            mapView.setRegion(region, animated: true)
            
            self.mapView.showsUserLocation = true
            
            myLocationLabel.text = "My Coordinates: \(myLocation.latitude), \(myLocation.longitude)"
        }
        
    }
    
    @IBAction func getWeatherDataButton(_ sender: Any) {
        Weather.forecast(latitude: myLatitude!, longitude: myLongitude!) { (results:[Weather]) in
            for weatherData in results {
                DispatchQueue.main.async {
                    let celsiusTemp: Double = (weatherData.temperature - 32)/1.8
                    self.temperatureLabel.text = "Now: " + String(format: "%.2f", celsiusTemp) + "°C"
                    
                    self.temperature = Int16(weatherData.temperature)
                    self.icon = weatherData.icon
                    
                    self.summaryLabel.text = weatherData.summary
                    self.temperatureLabel.isHidden = false
                    self.summaryLabel.isHidden = false
                    
                    self.createWeatherItem()
                }
               
            }
        }
        
        
    }
    
    func createWeatherItem() {

        let date = Date().description(with: Locale.current)
        let weatherItem = WeatherData(context: managedObjectContext)
        weatherItem.dateAndTime = date
        weatherItem.latitude = myLatitude!
        weatherItem.longitude = myLongitude!
        weatherItem.summary = summaryLabel.text
        weatherItem.temperature = temperature!
        weatherItem.icon = icon!

        do {
            try managedObjectContext.save()
            
            print("OK!")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

