//
//  SecondViewController.swift
//  Test_NBSoft
//
//  Created by Alexandr Yanski on 04.11.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var weather = [WeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherTableViewCell
        
        let presentItem = weather[indexPath.row]
        
        cell.dateLabel.text = presentItem.dateAndTime
        cell.latitudeLabel.text = "\(presentItem.latitude)"
        cell.longitudeLabel.text = "\(presentItem.longitude)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Segue", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            if let popupViewController = segue.destination as? PopupViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    popupViewController.presentItem = weather[indexPath.row]
                    
                }
  
            }            
        }
    }
    
    func loadData() {
        let weatherRequers: NSFetchRequest<WeatherData> = WeatherData.fetchRequest()
        do {
            weather = try managedObjectContext.fetch(weatherRequers)
            self.tableView.reloadData()

        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

