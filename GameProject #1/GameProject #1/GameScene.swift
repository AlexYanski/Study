//
//  GameScene.swift
//  GameProject #1
//
//  Created by Alexandr Yanski on 22.09.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import SpriteKit
class GameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "background1")
    let zombie = SKSpriteNode(imageNamed: "zombie1")
    
    var zombieAnimation: SKAction
    
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    
    let zombieMovePointsPerSec: CGFloat = 480.0
    let zombieRotateRadiansPerSec:CGFloat = 4.0 * π
    var velocity = CGPoint.zero
    
    let playableRect: CGRect
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        
        addChild(background)
        addChild(zombie)
        zombie.run(SKAction.repeatForever(zombieAnimation))

        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        background.zPosition = -1
        
        zombie.position = CGPoint(x: 400, y: 400)
        debugDrawPlayableArea()
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run() { [weak self] in self?.spawnEnemy()},
                                                      SKAction.wait(forDuration: 2.0)])))
        
        //zombie.size = CGSize(width: zombie.size.width * 2, height: zombie.size.height * 2)
        //or
        //zombie.setScale(2) <--- That's better :)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        //zombie.position = CGPoint(x: zombie.position.x + 8, y: zombie.position.y)
        
        move(sprite: zombie, velocity: velocity)
        rotate(sprite: zombie, direction: velocity, rotateRadiansPerSec: zombieRotateRadiansPerSec)
        //rotate(sprite: zombie, direction: velocity)
        boundsCheckZombie()

    }
    
    func move(sprite: SKSpriteNode, velocity: CGPoint) {
        
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt),
                                   y: velocity.y * CGFloat(dt))
        
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x,
                                  y: sprite.position.y + amountToMove.y)
    }
//    WITH MYUNITS
//    func move(sprite: SKSpriteNode, velocity: CGPoint) {
//        let amountToMove = velocity * CGFloat(dt)
//        print("Amount to move: \(amountToMove)")
//        sprite.position += amountToMove
//    }
    
    func moveZombieToward(location: CGPoint) {
        let offset = CGPoint(x: location.x - zombie.position.x,
                             y: location.y - zombie.position.y)
        
        let lengthOfOffset = sqrt(Double(offset.x * offset.x + offset.y * offset.y))
        
        let direction = CGPoint(x: offset.x / CGFloat(lengthOfOffset),
                                y: offset.y / CGFloat(lengthOfOffset))
        velocity = CGPoint(x: direction.x * zombieMovePointsPerSec,
                           y: direction.y * zombieMovePointsPerSec)
    }
    
    func sceneTouched(touchLocation: CGPoint) {
        moveZombieToward(location: touchLocation)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        sceneTouched(touchLocation: touchLocation)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        sceneTouched(touchLocation: touchLocation)
    }
    
    func boundsCheckZombie() {
        let bottomLeft = CGPoint(x: 0, y: playableRect.minY)
        let topRight = CGPoint(x: size.width, y: playableRect.maxY)
        if zombie.position.x <= bottomLeft.x {
            zombie.position.x = bottomLeft.x
            velocity.x = -velocity.x
        }
        if zombie.position.x >= topRight.x {
            zombie.position.x = topRight.x
            velocity.x = -velocity.x
        }
        if zombie.position.y <= bottomLeft.y {
            zombie.position.y = bottomLeft.y
            velocity.y = -velocity.y
        }
        if zombie.position.y >= topRight.y {
            zombie.position.y = topRight.y
            velocity.y = -velocity.y
        }
        
        
    }
    
    func rotate(sprite: SKSpriteNode, direction: CGPoint, rotateRadiansPerSec: CGFloat) {
        let shortest = shortestAngleBetween(angle1: zombie.zRotation, angle2: velocity.angle)
        let amountToRotate = min(rotateRadiansPerSec * CGFloat(dt), abs(shortest))
        
        sprite.zRotation += shortest.sign() * amountToRotate
        //sprite.zRotation = CGFloat(atan2(Double(direction.y), Double(direction.x)))
    }
    
    func spawnEnemy() {
        let enemy = SKSpriteNode(imageNamed: "enemy")
        enemy.position = CGPoint(x: size.width + enemy.size.width/2,
                                 y: CGFloat.random(min: playableRect.minY + enemy.size.height/2,
                                                   max: playableRect.maxY - enemy.size.height/2))
        addChild(enemy)
        let actionMove = SKAction.moveTo(x: -enemy.size.width/2, duration: 2.0)
        
        let actionRemove = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }
    
    
    override init(size: CGSize) {
        let maxAspectRatio: CGFloat = 16.0 / 9.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight) / 2.0
        playableRect = CGRect(x: 0, y: playableMargin,
                              width: size.width,
                              height: playableHeight)
        
        var textures:[SKTexture] = []
        // 2
        for i in 1...4 {
            textures.append(SKTexture(imageNamed: "zombie\(i)"))
        }
        // 3
        textures.append(textures[2])
        textures.append(textures[1])
        // 4
        zombieAnimation = SKAction.animate(with: textures,
                                           timePerFrame: 0.1)
        
        super.init(size: size)

    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func debugDrawPlayableArea() {
        let shape = SKShapeNode()
        let path = CGMutablePath()
        path.addRect(playableRect)
        shape.path = path
        shape.strokeColor = SKColor.red
        shape.lineWidth = 4.0
        addChild(shape)
    }
}
