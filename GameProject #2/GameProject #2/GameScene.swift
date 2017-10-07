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
    
    var tree = SKSpriteNode()
    
    let ground1 = SKSpriteNode()
    let ground2 = SKSpriteNode()
    let airGround = SKSpriteNode()
    
    let groundTexture = SKTexture(imageNamed: "ground")
    
    var guyAnimation = SKAction()
    var coinAnimation = SKAction()
    
    var guyGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    var coinGroup: UInt32 = 0x1 << 3
    
    var timerAddTree = Timer()
    var timerAddGroundAir = Timer()
    
    var isPlayerJumping = false
    var isPlayerDoubleJumping = false
    
    override func didMove(to view: SKView) {
        
        createBackground()
        createGround()
        moveGuy()

        timerFunc()
        
        self.physicsWorld.contactDelegate = self
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveBg()
        moveGround()
    }
    
    func createBackground() {
        background1.anchorPoint = CGPoint.zero
        background1.position = CGPoint.zero
        background1.zPosition = -10
        addChild(background1)
        
        background2.anchorPoint = CGPoint.zero
        background2.position = CGPoint(x: background1.size.width - 1, y: 0)
        background2.zPosition = -10
        addChild(background2)
        
    }
    
    func createGround() {
        ground1.position = CGPoint(x: self.frame.width/2, y: 20)

        ground1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 100))
        ground1.physicsBody?.isDynamic = false
        ground1.physicsBody?.categoryBitMask = groundGroup
        ground1.physicsBody?.restitution = 0
        ground1.zPosition = 1
        ground1.texture = groundTexture
        
        ground1.size.width = self.frame.width
        ground1.size.height = 100
        
        addChild(ground1)
        
        ground2.position = CGPoint(x: self.frame.width + self.frame.width/2 - 15, y: 20)
        
        ground2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 100))
        ground2.physicsBody?.isDynamic = false
        ground2.physicsBody?.categoryBitMask = groundGroup
        ground2.physicsBody?.restitution = 0
        ground2.zPosition = 1
        ground2.texture = groundTexture

        ground2.size.width = self.frame.width
        ground2.size.height = 100

        addChild(ground2)
    }
    
    @objc func spawnTree() {
        let movementAmount = arc4random() % UInt32(self.frame.size.width/2)
        let pipeOffset = CGFloat(movementAmount) + 200

        let temp = arc4random_uniform(3) + 1
        switch temp {
        case 1:
            tree = SKSpriteNode(imageNamed: "tree1")
            tree.zPosition = -7
            tree.position = CGPoint(x: self.frame.size.width + pipeOffset, y: 90)
        case 2:
            tree = SKSpriteNode(imageNamed: "tree2")
            tree.zPosition = -6
            tree.position = CGPoint(x: self.frame.size.width + pipeOffset, y: 210)
        case 3:
            tree = SKSpriteNode(imageNamed: "tree3")
            tree.zPosition = -5
            tree.position = CGPoint(x: self.frame.size.width + pipeOffset, y: 200)
        default:
            print("Error")
        }
        
        let moveTree = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 8)
        let removeTree = SKAction.removeFromParent()
        let repeatActionTree = SKAction.repeatForever(SKAction.sequence([moveTree, removeTree]))
        tree.run(repeatActionTree)
        
        addChild(tree)
    }
    
    @objc func spawnGroundInAir() {
        //airGround
        let pipeOffset = CGFloat(arc4random() % UInt32(self.frame.size.width/2)) + 200
        let temp = arc4random_uniform(2) + 1
        switch temp {
        case 1:
            airGround.position = CGPoint(x: self.frame.size.width + pipeOffset, y: 300)
            airGround.zPosition = 1
        case 2:
            airGround.position = CGPoint(x: self.frame.size.width + pipeOffset, y: 400)
            airGround.zPosition = 2
        default:
            print("Error")
        }
        airGround.size.width = 400
        airGround.size.height = 50
        
        airGround.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 400, height: 50))
        airGround.physicsBody?.isDynamic = false
        airGround.physicsBody?.categoryBitMask = groundGroup
        airGround.physicsBody?.restitution = 0
        airGround.texture = groundTexture
        
        let moveGroundAir = SKAction.moveBy(x: -self.frame.size.width*2, y: 0, duration: 8)
        let removeGroundAir = SKAction.removeFromParent()
        let repeatActionGround = SKAction.repeatForever(SKAction.sequence([moveGroundAir, removeGroundAir]))
        airGround.run(repeatActionGround)
        
        addChild(airGround)
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
        guy.physicsBody?.restitution = 0.0
        guy.physicsBody?.isDynamic = true
        guy.physicsBody?.allowsRotation = false
        
        addChild(guy)
        guy.run(SKAction.repeatForever(guyAnimation))
    
    }
    
    func moveBg() {
        background1.position = CGPoint(x: background1.position.x - 2, y: background1.position.y)
        background2.position = CGPoint(x: background2.position.x - 2, y: background2.position.y)
        
        if background1.position.x < -background1.size.width {
            background1.position = CGPoint(x: background2.position.x + background2.size.width, y: background1.position.y)
        }
        if background2.position.x < -background2.size.width {
            background2.position = CGPoint(x: background1.position.x + background1.size.width, y: background2.position.y)
        }
    }
    
    func moveGround() {
        ground1.position = CGPoint(x: ground1.position.x - 5, y: ground1.position.y)
        ground2.position = CGPoint(x: ground2.position.x - 5, y: ground2.position.y)
        
        if ground1.position.x < -self.frame.size.width/2 + 10 {
            ground1.position = CGPoint(x: ground2.position.x + ground2.size.width - 10, y: ground1.position.y)
        }
        if ground2.position.x < -self.frame.size.width/2 + 10 {
            ground2.position = CGPoint(x: ground1.position.x + ground1.size.width - 10, y: ground2.position.y)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isPlayerDoubleJumping == true {
            return
        }
        guy.physicsBody?.velocity = CGVector.zero
        guy.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 40))
        guy.size.width = 36
        guy.size.height = 46
        var textures:[SKTexture] = []
        for i in 1...2 {
            textures.append(SKTexture(imageNamed: "jump\(i)"))
        }
        
        guyAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)
        

        
        if isPlayerJumping {
            isPlayerDoubleJumping = true
            isPlayerJumping = false
            guy.run(SKAction.repeatForever(guyAnimation))

        } else {
            isPlayerJumping = true
            isPlayerDoubleJumping = false
            guy.run(SKAction.repeatForever(guyAnimation))

        }
        
    }
    
    func timerFunc() {
        timerAddTree.invalidate()
        timerAddGroundAir.invalidate()
        
        timerAddTree = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(GameScene.spawnTree), userInfo: nil, repeats: true)
        //timerAddGroundAir = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(GameScene.spawnGroundInAir), userInfo: nil, repeats: true)
    }
    
}

extension GameScene {
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == groundGroup || contact.bodyB.categoryBitMask == groundGroup {
            isPlayerDoubleJumping = false
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
