//
//  SecondViewController.swift
//  CodeKeeper
//
//  Created by Alexandr Yanski on 24.02.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstJavaButton: UIButton!
    @IBOutlet weak var secondJavaButton: UIButton!
    @IBOutlet weak var thirdJavaButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var questionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2;
        questionButton.layer.cornerRadius = questionButton.frame.size.width / 2;
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if firstJavaButton.isTouchInside || secondJavaButton.isTouchInside || thirdJavaButton.isTouchInside {
            let destViewController: PDFJavaViewController = segue.destination as! PDFJavaViewController
            if firstJavaButton.isTouchInside {
                destViewController.temp = 1
            } else if secondJavaButton.isTouchInside {
                destViewController.temp = 2
            } else if thirdJavaButton.isTouchInside {
                destViewController.temp = 3
            }
        } else if questionButton.isTouchInside {
            let tempViewController: HelpViewController = segue.destination as! HelpViewController
            tempViewController.helpTemp = 1
        }
        
    }
   
    @IBAction func dismissSecondVC(_ sender: Any) {
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
