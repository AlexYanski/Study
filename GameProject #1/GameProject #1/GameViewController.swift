//
//  GameViewController.swift
//  GameProject #1
//
//  Created by Alexandr Yanski on 22.09.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit
import SpriteKit
class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size:CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    } }
