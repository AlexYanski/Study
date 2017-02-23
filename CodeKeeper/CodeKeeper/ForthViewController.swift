//
//  ForthViewController.swift
//  CodeKeeper
//
//  Created by Alexandr Yanski on 23.02.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {

    @IBOutlet weak var dismissButtonThird: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dismissButtonThird.layer.cornerRadius = dismissButtonThird.frame.size.width / 2;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissForthVC(_ sender: Any) {
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