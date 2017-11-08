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

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var trackArray: [SKSpriteNode]? = [SKSpriteNode]()
    var player: SKSpriteNode?
    var target: SKSpriteNode?
    
    var pause: SKSpriteNode?
    var timeLabel: SKLabelNode?
    var scoreLabel: SKLabelNode?
    var currentScore: Int = 0 {
        didSet {
            self.scoreLabel?.text = "SCORE: \(self.currentScore)"
            GameHandler.sharedInstance.score = currentScore
        }
    }
    var remainingTime: TimeInterval = 60 {
        didSet {
            self.timeLabel?.text = "TIME: \(Int(self.remainingTime))"
        }
    }
    
    var currentTrack = 0
    var movingToTrack = false
    
    let moveSound = SKAction.playSoundFileNamed("move.wav", waitForCompletion: false)
    var backgroundSound: SKAudioNode!
    
    let trackVelocities = [100, 150, 170, 200, 250]
    var directionArray = [Bool]()
    var velocityArray = [Int]()

    let playerCategory: UInt32 = 0x1 << 0
    let enemyCategory: UInt32 = 0x1 << 1
    let targetCategory: UInt32 = 0x1 << 2
    let powerUpCategory: UInt32 = 0x1 << 3
    
    func createHUD() {
        pause = self.childNode(withName: "pause") as? SKSpriteNode
        timeLabel = self.childNode(withName: "time") as? SKLabelNode
        scoreLabel = self.childNode(withName: "score") as? SKLabelNode
        
        remainingTime = 60
        currentScore = 0
    }
    
    func setupTracks() {
        for i in 0...7 {
            if let track = self.childNode(withName: "\(i)") as? SKSpriteNode {
                trackArray?.append(track)
            }
        }
    }
    
    func createPlayer() {
        player = SKSpriteNode(imageNamed: "player")
        player?.physicsBody = SKPhysicsBody(circleOfRadius: player!.size.width / 2)
        player?.physicsBody?.linearDamping = 0
        player?.physicsBody?.categoryBitMask = playerCategory
        player?.physicsBody?.collisionBitMask = 0
        player?.physicsBody?.contactTestBitMask = enemyCategory | targetCategory | powerUpCategory
        
        guard let playerPosition = trackArray?.first?.position.x else {return}
        player?.position = CGPoint(x: playerPosition, y: self.size.height/2)
        self.addChild(player!)
        
        let pulse = SKEmitterNode(fileNamed: "pulse")!
        player?.addChild(pulse)
        pulse.position = CGPoint(x: 0, y: 0)
        
    }
    
    func createTarget() {
        target = self.childNode(withName: "target") as? SKSpriteNode
        target?.physicsBody = SKPhysicsBody(circleOfRadius: target!.size.width / 2)
        target?.physicsBody?.categoryBitMask = targetCategory
        target?.physicsBody?.collisionBitMask = 0
    }
    
    func createPowerUp(forTrack track: Int) -> SKSpriteNode? {
        let powerUpSprite = SKSpriteNode(imageNamed: "powerUp")
        powerUpSprite.name = "Enemy"
        
        powerUpSprite.physicsBody = SKPhysicsBody(circleOfRadius: powerUpSprite.size.width / 2)
        powerUpSprite.physicsBody?.linearDamping = 0
        powerUpSprite.physicsBody?.categoryBitMask = powerUpCategory
        powerUpSprite.physicsBody?.collisionBitMask = 0
        
        let up = directionArray[track]
        
        guard let powerUpXPosition = trackArray?[track].position.x else {return nil}
        
        powerUpSprite.position.x = powerUpXPosition
        powerUpSprite.position.y = up ? -130 : self.size.height + 130
        
        powerUpSprite.physicsBody?.velocity = up ? CGVector(dx: 0, dy: velocityArray[track]) : CGVector(dx: 0, dy: -velocityArray[track])
        
        return powerUpSprite
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
        enemySprite.physicsBody?.categoryBitMask = enemyCategory
        enemySprite.physicsBody?.velocity = up ? CGVector(dx: 0, dy: velocityArray[track]) : CGVector(dx: 0, dy: -velocityArray[track])
        
        return enemySprite
    }
    
    func spawnEnemies() {
        
        var randomTrackNumber = 0
        let createPowerUp = GKRandomSource.sharedRandom().nextBool()
        
        if createPowerUp {
            randomTrackNumber = GKRandomSource.sharedRandom().nextInt(upperBound: 5) + 1
            if let powerUpObject = self.createPowerUp(forTrack: randomTrackNumber) {
                self.addChild(powerUpObject)
            }
        }
        
        for i in 1...6 {
            if randomTrackNumber != i {
                let randomEnemyType = Enemies(rawValue: GKRandomSource.sharedRandom().nextInt(upperBound: 3))!
                if let newEneny = createEnemy(type: randomEnemyType, forTrack: i) {
                    self.addChild(newEneny)
                }
            }
        }
        
        self.enumerateChildNodes(withName: "Enemy") { (node: SKNode, nil) in
            if node.position.y < -150 || node.position.y > self.size.height + 150 {
                node.removeFromParent()
            }
        }
    }
    
    func movePlayerToStart() {
        if let player = self.player {
            player.removeFromParent()
            self.player = nil
            self.createPlayer()
            self.currentTrack = 0
        }
    }
    
    func nextLevel(playerPhysicsBody: SKPhysicsBody) {
        self.run(SKAction.playSoundFileNamed("levelUp.wav", waitForCompletion: true))
        let emitter = SKEmitterNode(fileNamed: "fireworks.sks")
        playerPhysicsBody.node?.addChild(emitter!)
        currentScore += 1
        
        self.run(SKAction.wait(forDuration: 0.5)) {
            emitter?.removeFromParent()
            self.movePlayerToStart()
        }
    }
    
    func launchGameTimer() {
        let timeAction = SKAction.repeatForever(SKAction.sequence([SKAction.run({
            self.remainingTime -= 1
        }), SKAction.wait(forDuration: 1)]))
        
        timeLabel?.run(timeAction)
        
    }
    
    override func didMove(to view: SKView) {
        setupTracks()
        createHUD()
        launchGameTimer()
        
        createPlayer()
        createTarget()
        
        self.physicsWorld.contactDelegate = self
        
        if let musicURL = Bundle.main.url(forResource: "background", withExtension: "wav") {
            backgroundSound = SKAudioNode(url: musicURL)
            addChild(backgroundSound)
        }

        if let numberOfTracks = trackArray?.count {
            for _ in 0 ... numberOfTracks {
                let randomNumberForVelocity = GKRandomSource.sharedRandom().nextInt(upperBound: 5)
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
            movingToTrack = false
        } else {
            let moveAction = SKAction.moveBy(x: 0, y: -3, duration: 0.01)
            let repeatAction = SKAction.repeatForever(moveAction)
            player?.run(repeatAction)
            movingToTrack = false
        }
    }
    
    func moveToNextTrack() {
        player?.removeAllActions()
        movingToTrack = true
        
        guard let nextTrack = trackArray?[currentTrack + 1].position else {return}
        
        if let player = self.player {
            let moveAction = SKAction.move(to: CGPoint(x: nextTrack.x, y: player.position.y), duration: 0.2)
            
            let up = directionArray[currentTrack + 1]
            
            player.run(moveAction, completion: {
                self.movingToTrack = false
                
                if self.currentTrack != 7 {
                    self.player?.physicsBody?.velocity = up ? CGVector(dx: 0, dy: self.velocityArray[self.currentTrack]) : CGVector(dx: 0, dy: -self.velocityArray[self.currentTrack])
                } else {
                    self.player?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                }
        
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
                if currentTrack < 7 {
                    moveToNextTrack()
                }
            } else if node?.name == "up" {
                moveVertically(up: true)
            } else if node?.name == "down" {
                moveVertically(up: false)
            } else if node?.name == "pause", let scene = self.scene {
                if scene.isPaused {
                    scene.isPaused = false
                } else {
                    scene.isPaused = true
                }
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
    
    func didBegin(_ contact: SKPhysicsContact) {
        var playerBody: SKPhysicsBody
        var otherBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            playerBody = contact.bodyA
            otherBody = contact.bodyB
        } else {
            playerBody = contact.bodyB
            otherBody = contact.bodyA
        }
        
        if playerBody.categoryBitMask == playerCategory && otherBody.categoryBitMask == enemyCategory {
            self.run(SKAction.playSoundFileNamed("fail.wav", waitForCompletion: true))
            movePlayerToStart()
        } else if playerBody.categoryBitMask == playerCategory && otherBody.categoryBitMask == targetCategory {
            nextLevel(playerPhysicsBody: playerBody)
        } else if playerBody.categoryBitMask == playerCategory && otherBody.categoryBitMask == powerUpCategory {
            self.run(SKAction.playSoundFileNamed("powerUp", waitForCompletion: true))
            otherBody.node?.removeFromParent()
            remainingTime += 5
        }
    }
    
    func gameOver() {
        GameHandler.sharedInstance.saveGameStats()
        
        self.run(SKAction.playSoundFileNamed("levelCompleted.wav", waitForCompletion: true))
        
        let transition = SKTransition.fade(withDuration: 1)
        if let gameOverScene = SKScene(fileNamed: "GameOverScene") {
            gameOverScene.scaleMode = .aspectFit
            self.view?.presentScene(gameOverScene, transition: transition)
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if let player = self.player {
            if player.position.y > self.size.height || player.position.y < 0 {
                self.run(SKAction.playSoundFileNamed("fail.wav", waitForCompletion: true))
                movePlayerToStart()
            }
        }
        
        if remainingTime <= 5 {
            timeLabel?.fontColor = UIColor.red
        }
        if remainingTime == 0 {
            gameOver()
        }
    }
}
