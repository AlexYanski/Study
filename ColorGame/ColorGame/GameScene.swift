//
//  GameScene.swift
//  ColorGame
//
//  Created by Alexandr Yanski on 27.10.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import SpriteKit
import GameplayKit

enum Enemies: Int {
    case small
    case medium
    case large
}

class GameScene: SKScene {
    
    var trackArray: [SKSpriteNode]? = [SKSpriteNode]()
    var player: SKSpriteNode?
    
    var currentTrack = 0
    var movingToTrack = false
    
    let moveSound = SKAction.playSoundFileNamed("move.wav", waitForCompletion: false)
    
    let trackVelocities = [180, 200, 250]
    var directionArray = [Bool]()
    var velocityArray = [Int]()

    
    func setupTracks() {
        for i in 0...7 {
            if let track = self.childNode(withName: "\(i)") as? SKSpriteNode {
                trackArray?.append(track)
            }
        }
    }
    
    func createPlayer() {
        player = SKSpriteNode(imageNamed: "player")
        
        guard let playerPosition = trackArray?.first?.position.x else {return}
        player?.position = CGPoint(x: playerPosition, y: self.size.height/2)
        self.addChild(player!)
        
        let pulse = SKEmitterNode(fileNamed: "pulse")!
        player?.addChild(pulse)
        pulse.position = CGPoint(x: 0, y: 0)
        
    }
    
    func createEnemy(type: Enemies, forTrack track: Int) -> SKShapeNode? {
        
        let enemySprite = SKShapeNode()
        enemySprite.name = "Enemy"
        
        switch type {
        case .small:
            enemySprite.path = CGPath(roundedRect: CGRect(x: -10, y: 0, width: 20, height: 70), cornerWidth: 8, cornerHeight: 8, transform: nil)
            enemySprite.fillColor = UIColor(red: 0.4431, green: 0.5529, blue: 0.7451, alpha: 1)
        case .medium:
            enemySprite.path = CGPath(roundedRect: CGRect(x: -10, y: 0, width: 20, height: 100), cornerWidth: 8, cornerHeight: 8, transform: nil)
            enemySprite.fillColor = UIColor(red: 0.7804, green: 0.4039, blue: 0.4039, alpha: 1)
        case .large:
            enemySprite.path = CGPath(roundedRect: CGRect(x: -10, y: 0, width: 20, height: 130), cornerWidth: 8, cornerHeight: 8, transform: nil)
            enemySprite.fillColor = UIColor(red: 0.7804, green: 0.6392, blue: 0.4039, alpha: 1)
        }
        
        guard let enemyPosition = trackArray?[track].position else {return nil}
        
        let up = directionArray[track]
        
        enemySprite.position.x = enemyPosition.x
        enemySprite.position.y = up ? -130 : self.size.height + 130
        
        enemySprite.physicsBody = SKPhysicsBody(edgeLoopFrom: enemySprite.path!)
        enemySprite.physicsBody?.velocity = up ? CGVector(dx: 0, dy: velocityArray[track]) : CGVector(dx: 0, dy: -velocityArray[track])
        
        return enemySprite
    }
    
    func spawnEnemies() {
        for i in 1...6 {
            let randomEnemyType = Enemies(rawValue: GKRandomSource.sharedRandom().nextInt(upperBound: 3))!
            if let newEneny = createEnemy(type: randomEnemyType, forTrack: i) {
                self.addChild(newEneny)
            }
        }
        
        self.enumerateChildNodes(withName: "Enemy") { (node: SKNode, nil) in
            if node.position.y < -150 || node.position.y > self.size.height + 150 {
                node.removeFromParent()
            }
        }
    }
    
    override func didMove(to view: SKView) {
        setupTracks()
        createPlayer()

        if let numberOfTracks = trackArray?.count {
            for _ in 0 ... numberOfTracks {
                let randomNumberForVelocity = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
                velocityArray.append(trackVelocities[randomNumberForVelocity])
                directionArray.append(GKRandomSource.sharedRandom().nextBool())
            }
        }
        
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
            self.spawnEnemies()
            }, SKAction.wait(forDuration: 2)])))
    }
    
    func moveVertically(up: Bool) {
        if up {
            let moveAction = SKAction.moveBy(x: 0, y: 3, duration: 0.01)
            let repeatAction = SKAction.repeatForever(moveAction)
            player?.run(repeatAction)
        } else {
            let moveAction = SKAction.moveBy(x: 0, y: -3, duration: 0.01)
            let repeatAction = SKAction.repeatForever(moveAction)
            player?.run(repeatAction)
        }
    }
    
    func moveToNextTrack() {
        player?.removeAllActions()
        movingToTrack = true
        
        guard let nextTrack = trackArray?[currentTrack + 1].position else {return}
        
        if let player = self.player {
            let moveAction = SKAction.move(to: CGPoint(x: nextTrack.x, y: player.position.y), duration: 0.2)
            player.run(moveAction, completion: {
                self.movingToTrack = false
            })
            currentTrack += 1
            self.run(moveSound)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first
            
            if node?.name == "right" {
                moveToNextTrack()
            } else if node?.name == "up" {
                moveVertically(up: true)
            } else if node?.name == "down" {
                moveVertically(up: false)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !movingToTrack {
            player?.removeAllActions()
        }
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        player?.removeAllActions()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
