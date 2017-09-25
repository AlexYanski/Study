//
//  GameViewController.swift
//  ZombieConga
//
//  Created by Alexandr Yanski on 22.09.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size:CGSize(width: 2048, height: 1536))
        let skview = self.view as! SKView
        skview.showsFPS = true
        skview.showsNodeCount = true
        skview.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skview.presentScene(scene)
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
}
