//
//  ViewController.swift
//  PR_4(SimpleToDoList)
//
//  Created by Alexandr Yanski on 28.02.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textImput: UITextField!
    @IBOutlet weak var textOutput: UITextView!
    
    var items:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItem(_ sender: Any) {
        if (textImput.text! == "") {
            return
        }
        items.append(textImput.text!)
        textOutput.text = ""
        for item in items {
            textOutput.text.append("\(item)\n")
        }
        textImput.text = ""
        textImput.resignFirstResponder()
    }

}

