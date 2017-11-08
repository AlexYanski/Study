//
//  GameScene.swift
//  GameProject#2
//
//  Created by Alexandr Yanski on 04.11.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var hero: SKSpriteNode?
    var wall1: SKSpriteNode?
    var wall2: SKSpriteNode?
    var wall3: SKSpriteNode?
    var wall4: SKSpriteNode?

    
    let heroCategory: UInt32 = 0x1 << 0
    let wallsCategory: UInt32 = 0x1 << 1
    
    func createHero() {
        hero = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 100))
        hero?.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 100))
        hero?.physicsBody?.categoryBitMask = heroCategory
        hero?.physicsBody?.collisionBitMask = 0
        hero?.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        
        addChild(hero!)
    }
    
//    func moveHero() {
//
//    }
    
    func createWalls() {
        wall1 = self.childNode(withName: "wall1") as? SKSpriteNode
        wall2 = self.childNode(withName: "wall2") as? SKSpriteNode
        wall3 = self.childNode(withName: "wall3") as? SKSpriteNode
        wall4 = self.childNode(withName: "wall4") as? SKSpriteNode
        
        wall1?.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 1300))
        wall2?.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 1280))
        wall3?.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 1280))
        wall4?.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 1280))
        
        wall1?.physicsBody?.categoryBitMask = wallsCategory
        wall2?.physicsBody?.categoryBitMask = wallsCategory
        wall3?.physicsBody?.categoryBitMask = wallsCategory
        wall4?.physicsBody?.categoryBitMask = wallsCategory
        
        wall1?.physicsBody?.collisionBitMask = 0
        wall2?.physicsBody?.collisionBitMask = 0
        wall3?.physicsBody?.collisionBitMask = 0
        wall4?.physicsBody?.collisionBitMask = 0
        
        addChild(wall1!)
        addChild(wall2!)
        addChild(wall3!)
        addChild(wall4!)
    }
    
    override func didMove(to view: SKView) {
        
        createHero()
        createWalls()
        
        self.physicsWorld.contactDelegate = self

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            hero?.position.x = location.x
            hero?.position.y = location.y
        }
    }
    
    
    
}
