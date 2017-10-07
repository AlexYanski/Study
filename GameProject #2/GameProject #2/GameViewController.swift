//
//  GameViewController.swift
//  GameProject #2
//
//  Created by Alexandr Yanski on 04.10.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        let scene = GameScene(size:CGSize(width: 1280, height: 720))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
