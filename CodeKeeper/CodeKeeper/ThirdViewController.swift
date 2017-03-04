//
//  ThirdViewController.swift
//  CodeKeeper
//
//  Created by Alexandr Yanski on 23.02.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var dismissButtonSecond: UIButton!
    @IBOutlet weak var firstCppButton: UIButton!
    @IBOutlet weak var secondCppButton: UIButton!
    @IBOutlet weak var thirdCppButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dismissButtonSecond.layer.cornerRadius = dismissButtonSecond.frame.size.width / 2;

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: PDFJavaViewController = segue.destination as! PDFJavaViewController
        if firstCppButton.isTouchInside {
            destViewController.temp = 4
        } else if secondCppButton.isTouchInside {
            destViewController.temp = 5
        } else if thirdCppButton.isTouchInside {
            destViewController.temp = 6
        }
    }
    
    @IBAction func dismissThirdVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
