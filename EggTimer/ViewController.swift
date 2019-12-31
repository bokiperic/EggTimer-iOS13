//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Dictionary
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @objc func updateTimer() {
        if (secondsPassed < totalTime) {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentageProgress
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

}
