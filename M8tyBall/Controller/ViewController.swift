//
//  ViewController.swift
//  M8tyBall
//
//  Created by Илья Валито on 21.09.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    
    // Create a player to play osund.
    var player: AVAudioPlayer!
    // Play a specific sound from the Sounds folder.
    func playSound(titleLetter: String) {
        let url = Bundle.main.url(forResource: titleLetter, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    let answersArray: [String] = [
        "Yes",
        "No",
        "Maybe",
        "Ask again later",
        "Get help",
        "Ask your mom",
        "I'll remember that",
        "42",
        "Not today, pal"
    ]
 
    @IBAction func ballPressed(_ sender: UIButton) {
        
        answerLabel.text = answersArray.randomElement()
        playSound(titleLetter: "magic")
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        answerLabel.text = answersArray.randomElement()
        playSound(titleLetter: "magic")
    }
}

