//
//  ViewController.swift
//  CodeKeeper
//
//  Created by Alexandr Yanski on 20.02.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var bkgImage: UIImageView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var menuButtonSecond: UIButton!
    @IBOutlet weak var menuButtonThird: UIButton!
    @IBOutlet weak var popButton: UIButton!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    
    var firstButtonCenter: CGPoint!
    var secondButtonCenter: CGPoint!
    var thirdButtonCenter: CGPoint!

    
    let transition = CircularTransition()
    
    var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
        menuButtonSecond.layer.cornerRadius = menuButtonSecond.frame.size.width / 2
        menuButtonThird.layer.cornerRadius = menuButtonThird.frame.size.width / 2
        popButton.layer.cornerRadius = popButton.frame.size.width / 2

        firstButtonCenter = menuButton.center
        secondButtonCenter = menuButtonSecond.center
        thirdButtonCenter = menuButtonThird.center

        
        menuButton.center = popButton.center
        menuButtonSecond.center = popButton.center
        menuButtonThird.center = popButton.center
        
    }
    
    @IBAction func popButtonOC(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "moreOn") {
            sender.setImage(#imageLiteral(resourceName: "moreOff"), for: .normal)
            UIView.animate(withDuration: 0.2) {
                //animate blur
                self.visualEffectView.effect = self.effect
            }

            UIView.animate(withDuration: 0.3, animations: {
                //animate button
                self.menuButton.center = self.firstButtonCenter
                self.menuButtonSecond.center = self.secondButtonCenter
                self.menuButtonThird.center = self.thirdButtonCenter
                
            })
        } else {
            sender.setImage(#imageLiteral(resourceName: "moreOn"), for: .normal)
            UIView.animate(withDuration: 0.2) {
                //animate blur
                self.visualEffectView.effect = nil
            }
            UIView.animate(withDuration: 0.3, animations: {
                self.menuButton.center = self.popButton.center
                self.menuButtonSecond.center = self.popButton.center
                self.menuButtonThird.center = self.popButton.center
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if menuButton.isTouchInside {
            let secondVC = segue.destination as! SecondViewController
            secondVC.transitioningDelegate = self
            secondVC.modalPresentationStyle = .custom

        }
        if menuButtonSecond.isTouchInside {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.transitioningDelegate = self
            thirdVC.modalPresentationStyle = .custom
        }
        if menuButtonThird.isTouchInside {
            let forthVC = segue.destination as! ForthViewController
            forthVC.transitioningDelegate = self
            forthVC.modalPresentationStyle = .custom
        }
        
    }
    
    var temp = 0
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if menuButton.isTouchInside {
            transition.transitionMode = .present
            transition.startingPoint = menuButton.center
            transition.circleColor = menuButton.backgroundColor!
            temp = 1
        }
        if menuButtonSecond.isTouchInside {
            transition.transitionMode = .present
            transition.startingPoint = menuButtonSecond.center
            transition.circleColor = menuButtonSecond.backgroundColor!
            temp = 0
        }
        if menuButtonThird.isTouchInside {
            transition.transitionMode = .present
            transition.startingPoint = menuButtonThird.center
            transition.circleColor = menuButtonThird.backgroundColor!
            temp = 2
        }
        return transition
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        if temp == 2 {
            transition.transitionMode = .dismiss
            transition.startingPoint = menuButtonThird.center
            transition.circleColor = menuButtonThird.backgroundColor!
        }
        if temp == 1 {
            transition.transitionMode = .dismiss
            transition.startingPoint = menuButton.center
            transition.circleColor = menuButton.backgroundColor!
        }
        if temp == 0 {
            transition.transitionMode = .dismiss
            transition.startingPoint = menuButtonSecond.center
            transition.circleColor = menuButtonSecond.backgroundColor!
        }
        return transition
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

