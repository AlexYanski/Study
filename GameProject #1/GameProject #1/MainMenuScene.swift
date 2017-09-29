//
//  MainMenuScene.swift
//  GameProject #1
//
//  Created by Alexandr Yanski on 28.09.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "MainMenu")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let _ = touches.first else {
            return
        }
        sceneTapted()
        
    }
    
    func sceneTapted() {
        let transition = SKTransition.doorsCloseHorizontal(withDuration: 1.5)
        let nextScene = GameScene(size: size)
        nextScene.scaleMode = scaleMode
        view?.presentScene(nextScene, transition: transition)
    }
}
