//
//  GameHandler.swift
//  ColorGame
//
//  Created by Alexandr Yanski on 03.11.2017.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import Foundation

class GameHandler {
    var score: Int
    var highScore: Int
    
    class var sharedInstance: GameHandler {
        struct Singleton {
            static let instance = GameHandler()
        }
        
        return Singleton.instance
    }
    
    init() {
        score = 0
        highScore = 0
        
        let userDefaults = UserDefaults.standard
        highScore = userDefaults.integer(forKey: "highScore")
    }
    
    func saveGameStats() {
        highScore = max(score, highScore)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(highScore, forKey: "highScore")
        userDefaults.synchronize()
    }
    
}
