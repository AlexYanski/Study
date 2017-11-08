//
//  GameOverScene.swift
//  ColorGame
//
//  Created by Alexandr Yanski on 03.11.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOverScene: SKScene {
    
    var lastScoreLabel: SKLabelNode?
    var bestScoreLabel: SKLabelNode?
    
    var playButton: SKSpriteNode?

    var backgroundMusic: SKAudioNode!
    
    var scrollingBG: ScrollingBackground?
    
    override func didMove(to view: SKView) {
        lastScoreLabel = self.childNode(withName: "lastScoreLabel") as? SKLabelNode
        bestScoreLabel = self.childNode(withName: "bestScoreLabel") as? SKLabelNode
        
        lastScoreLabel?.text = "\(GameHandler.sharedInstance.score)"
        bestScoreLabel?.text = "\(GameHandler.sharedInstance.highScore)"
        
        playButton = self.childNode(withName: "startButton") as? SKSpriteNode
        
        scrollingBG = ScrollingBackground.scrollingNodeWithImage(imageName: "loopBG", containerWidth: self.size.width)
        scrollingBG?.scrollingSpeed = 1.5
        scrollingBG?.anchorPoint = .zero
        
        self.addChild(scrollingBG!)
        
        if let musicURL = Bundle.main.url(forResource: "MenuHighscoreMusic", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            let node = self.atPoint(position)
            
            if node == playButton {
                let transition = SKTransition.fade(withDuration: 1)
                if let gameScaene = SKScene(fileNamed: "GameScene") {
                    gameScaene.scaleMode = .aspectFit
                    self.view?.presentScene(gameScaene, transition: transition)
                }
                
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let scrollBG = self.scrollingBG {
            scrollBG.update(currentTime: currentTime)
        }
    }
}
