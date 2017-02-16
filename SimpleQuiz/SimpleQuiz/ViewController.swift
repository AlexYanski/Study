//
//  ViewController.swift
//  SimpleQuiz
//
//  Created by Alexandr Yanski on 14.02.17.
//  Copyright © 2017 Alexandr Yanski. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBOutlet weak var imagePeanutButter: UIImageView!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made for?",
        "What time is it?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes",
        "It's peanut butter jelly time!!!"
    ]
    
    var currentQuestionIndex: Int = 0;
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1;
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0;
            imagePeanutButter.isHidden = true
            audioPlayer.stop()
        }
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        if answerLabel.text == "It's peanut butter jelly time!!!" {
            imagePeanutButter.isHidden = false
            audioPlayer.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex];
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
        }
        catch {
            print(error)
        }
        imagePeanutButter.loadGif(name: "Peanut-butter-jelly-time")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

