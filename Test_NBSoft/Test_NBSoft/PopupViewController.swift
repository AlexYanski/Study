//
//  PopupViewController.swift
//  Test_NBSoft
//
//  Created by Alexandr Yanski on 07.11.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit
import CoreData

class PopupViewController: UIViewController {

    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var presentItem: WeatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let celsiusTemp = (Double(presentItem!.temperature) - 32)/1.8
        if presentItem != nil {
            dateLabel.text = presentItem!.dateAndTime!
            summaryLabel.text = presentItem!.summary!
            tempLabel.text = String(format: "%.2f", celsiusTemp) + "°C"
            latitudeLabel.text = "\(presentItem!.latitude)"
            longitudeLabel.text = "\(presentItem!.longitude)"
            iconImageView.image = UIImage(named: presentItem!.icon!)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
