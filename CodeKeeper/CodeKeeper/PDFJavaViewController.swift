//
//  PDFJavaViewController.swift
//  CodeKeeper
//
//  Created by Alexandr Yanski on 27.02.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit

class PDFJavaViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var dismissOutlet: UIButton!
    
    var temp = NSInteger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //dismissOutlet.layer.cornerRadius = dismissOutlet.frame.size.width / 2;
        switch temp {
        case 1:
            let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "JavaFirst", ofType: "pdf")!)
            let request = URLRequest(url: path as URL)
            webView.loadRequest(request)
            break
        case 2:
            let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "JavaSecond", ofType: "pdf")!)
            let request = URLRequest(url: path as URL)
            webView.loadRequest(request)
            break
        case 3:
            let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "JavaThird", ofType: "pdf")!)
            let request = URLRequest(url: path as URL)
            webView.loadRequest(request)
            break
        case 4:
            let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "CppFirst", ofType: "pdf")!)
            let request = URLRequest(url: path as URL)
            webView.loadRequest(request)
            break
        case 5:
            let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "CppSecond", ofType: "pdf")!)
            let request = URLRequest(url: path as URL)
            webView.loadRequest(request)
            break
        case 6:
            let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "CppThird", ofType: "pdf")!)
            let request = URLRequest(url: path as URL)
            webView.loadRequest(request)
            break
        case 7:
            let path = NSURL(fileURLWithPath: Bundle.main.path(forResource: "SwiftFirst", ofType: "pdf")!)
            let request = URLRequest(url: path as URL)
            webView.loadRequest(request)
            break
        default: return
        }
        
    }
    
    @IBAction func dismissPDFVC(_ sender: Any) {
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
