//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let eggTimer = ["Soft" : 30,
                    "Medium" : 40,
                    "Hard" : 70]
    var countdownTimer: Timer!
    var secondsRemainig = 0
    var maxTime = 0
    
    @IBOutlet weak var boildPregress: UIProgressView!
    @IBOutlet weak var titleText: UILabel!
    
    @IBAction func onPressed(_ sender: UIButton) {
        endTimer()
        boildPregress.isHidden = false
        boildPregress.progress = 0.0
        let hardness = sender.currentTitle!
        secondsRemainig = 1
        maxTime = eggTimer[hardness]!
        titleText.text = hardness
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime(){
        if(secondsRemainig<=maxTime) {
            let per = Float(secondsRemainig)/Float(maxTime)
            print("\(per) Seconds")
            boildPregress.progress = per
            secondsRemainig+=1
            } else{
            endTimer()
            titleText.text = "Done"
        }
    }
    
    func endTimer() {
        if countdownTimer != nil {
        countdownTimer.invalidate()
        }
    }
    
}
