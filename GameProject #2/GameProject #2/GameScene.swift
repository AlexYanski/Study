//
//  GameScene.swift
//  GameProject #2
//
//  Created by Alexandr Yanski on 04.10.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
   
    let background1 = SKSpriteNode(imageNamed: "background")
    let background2 = SKSpriteNode(imageNamed: "background")
    let guy = SKSpriteNode(imageNamed: "walk1")
    let coin = SKSpriteNode(imageNamed: "Coin0")
    let ground = SKSpriteNode()
    
    let groundTexture = SKTexture(imageNamed: "ground")
    
    var guyAnimation = SKAction()
    var coinAnimation = SKAction()
    
    var guyGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    var coinGroup: UInt32 = 0x1 << 3
    
    let cameraNode = SKCameraNode()
    
    override func didMove(to view: SKView) {
        
        createBackground()
        createGround()
        moveGuy()
        spawnCoin()
        
        self.physicsWorld.contactDelegate = self
    }
    
    func createBackground() {
        background1.anchorPoint = CGPoint.zero
        background1.position = CGPoint.zero
        background1.zPosition = -1
        addChild(background1)
        
        background2.anchorPoint = CGPoint.zero
        background2.position = CGPoint(x: background1.size.width - 1, y: 0)
        background2.zPosition = -1
        addChild(background2)
        
    }
    
    func createGround() {
        ground.position = CGPoint(x: self.frame.width/2, y: 0)

        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 100))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = groundGroup
        ground.zPosition = 1
        ground.texture = groundTexture
        
        ground.size.width = self.frame.width
        ground.size.height = 100
        
        addChild(ground)
    }
    
    func spawnCoin() {
        var textures:[SKTexture] = []
        for i in 0...3 {
            textures.append(SKTexture(imageNamed: "Coin\(i)"))
        }
        coinAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)
        coin.run(SKAction.repeatForever(coinAnimation))

        coin.size.width = 10
        coin.size.height = 10
        addChild(coin)
        
        // Доделать после земли
    }
    
    func moveGuy() {
        guy.position = CGPoint(x: 200, y: 200)
        guy.size.width = 36
        guy.size.height = 46
        var textures:[SKTexture] = []
        for i in 1...2 {
            textures.append(SKTexture(imageNamed: "jump\(i)"))
        }

        guyAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)
        guy.zPosition = 1
        
        //Physics
        guy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: guy.size.width - 5, height: guy.size.height - 5))
        guy.physicsBody?.categoryBitMask = guyGroup
        guy.physicsBody?.contactTestBitMask = groundGroup
        guy.physicsBody?.collisionBitMask = groundGroup
        guy.physicsBody?.isDynamic = true
        guy.physicsBody?.allowsRotation = false
        
        addChild(guy)
        guy.run(SKAction.repeatForever(guyAnimation))
    
    }
    
    func moveBg() {
        background1.position = CGPoint(x: background1.position.x - 5, y: background1.position.y)
        background2.position = CGPoint(x: background2.position.x - 5, y: background2.position.y)
        
        if background1.position.x < -background1.size.width {
            background1.position = CGPoint(x: background2.position.x + background2.size.width, y: background1.position.y)
        }
        if background2.position.x < -background2.size.width {
            background2.position = CGPoint(x: background1.position.x + background1.size.width, y: background2.position.y)
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveBg()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guy.physicsBody?.velocity = CGVector.zero
        guy.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 40))
        guy.size.width = 36
        guy.size.height = 46
        var textures:[SKTexture] = []
        for i in 1...2 {
            textures.append(SKTexture(imageNamed: "jump\(i)"))
        }
        
        guyAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)
        guy.run(SKAction.repeatForever(guyAnimation))

    }
    
}

extension GameScene {
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == groundGroup || contact.bodyB.categoryBitMask == groundGroup {
            
            var textures:[SKTexture] = []
            for i in 1...5 {
                textures.append(SKTexture(imageNamed: "walk\(i)"))
            }
            guy.size.width = 50
            guy.size.height = 42
            guyAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)
            guy.run(SKAction.repeatForever(guyAnimation))
        }
    }
}
