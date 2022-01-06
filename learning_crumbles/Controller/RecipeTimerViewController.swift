//
//  RecipeTimerViewController.swift
//  learning_crumbles
//
//  Created by Hazel Kim on 6/1/22.
//  Copyright © 2022 Hazel Kim. All rights reserved.
//

import UIKit
import AVFoundation


class RecipeTimerViewController: UIViewController {

    let levels : [String : Int] = ["Soft": 300, "Medium": 420, "Hard": 600]
    
    var remainingTime = 60
    var timer = Timer()
    var selection : String = ""
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 1
        
        selection = sender.currentTitle!
        remainingTimeLabel.text = selection
        remainingTime = levels[selection]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    
    @objc func updateTimer() {
        if remainingTime > 0 {
            print(remainingTime)
            remainingTime -= 1
            progressBar.progress = Float(remainingTime) / Float(levels[selection]!)
            remainingTimeLabel.text = "\(remainingTime)"
        } else {
            remainingTimeLabel.text = "EGGS READY"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }


}
