//
//  HelpViewController.swift
//  CodeKeeper
//
//  Created by Alexandr Yanski on 24.03.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var helpText: UITextView!
    @IBOutlet weak var dismissHelpButton: UIButton!

    var helpTemp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch helpTemp {
            case 1:
            self.view.backgroundColor = UIColor(red: 255/255, green: 60/255, blue: 78/255, alpha: 1)
            break
            
            case 2:
            self.view.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            break
            
            case 3:
            self.view.backgroundColor = UIColor(red: 250/255, green: 105/255, blue: 47/255, alpha: 1)
            break
            default: return
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
