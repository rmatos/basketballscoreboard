//
//  ViewController.swift
//  Basketball Scoreboard
//
//  Created by Rudy E. Matos Perez on 9/5/15.
//  Copyright (c) 2015 Rudy Matos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var homeSide = Sides()
    var guestSide = Sides()
    var sbBrain = ScoreboardBrain()
    var timerBrain = TimerBrain()
    var timer = NSTimer()
    var isTimerRunning = false
    
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var guestScore: UILabel!
    @IBOutlet weak var homeFouls: UILabel!
    @IBOutlet weak var guestFouls: UILabel!
    @IBOutlet weak var timerUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeSide.currentScore = 0
        homeSide.currentFoul = 0
        homeSide.name = "Home"
        
        guestSide.currentScore = 0
        guestSide.currentFoul = 0
        guestSide.name = "Guest"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculatePointsHome(sender: UIButton) {
        var currentValue = sender.currentTitle!
        calculatePoints(currentValue, currentSide:homeSide)
    }
    
    @IBAction func calculatePointsGuest(sender: UIButton) {
        var currentValue = sender.currentTitle!
        calculatePoints(currentValue, currentSide:guestSide)
    }
    
    
    func calculatePoints(currentValue: String, currentSide:Sides){
        switch currentValue {
        case "+1" :
            sbBrain.calculatePoints(Points.One,side:currentSide)
        case "+2" :
            sbBrain.calculatePoints(Points.Two,side:currentSide)
        case "+3" :
            sbBrain.calculatePoints(Points.Three,side:currentSide)
        case "-1" :
            sbBrain.calculatePoints(Points.MinusOne,side:currentSide)
        default:
            println("Invalid Value")
        }
        if currentSide.name == "Home"{
            homeScore.text = "\(currentSide.currentScore)"
        }else{
            guestScore.text = "\(currentSide.currentScore)"
        }
        
    }
    
    @IBAction func startStopTimer(sender: UIButton) {
        if !timerBrain.isTimerDone{
            if !isTimerRunning{
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("calculateTime"), userInfo: nil, repeats: true)
                isTimerRunning=true
            }else{
                timer.invalidate()
                isTimerRunning  = false
            }
        }
    }
    
    @IBAction func addFixedMinutes(sender: UIButton) {
        var currentValue = sender.currentTitle!
        timerBrain.minutes = currentValue.toInt()!
        timerBrain.isTimerDone = false
        timerUILabel.text = timerBrain.getFixedTime()
    }
    
    @IBAction func addManualMinutes(sender: UIStepper) {
        timerBrain.minutes = Int(sender.value)
        timerBrain.isTimerDone = false
        timerUILabel.text = timerBrain.getFixedTime()
    }
    
    @IBAction func addManualSeconds(sender: UIStepper) {
        timerBrain.seconds = Int(sender.value)
        timerBrain.isTimerDone = false
        timerUILabel.text = timerBrain.getFixedTime()
    }
    
    func calculateTime(){
        timerBrain.calculateTime();
        timerUILabel.text = timerBrain.getFixedTime()
        if timerBrain.isTimerDone{
            timer.invalidate()
            isTimerRunning = false
        }
        
    }
    
    @IBAction func calculateFoulsHome(sender: UIStepper) {
        var currentValue = Int(sender.value)
        calculateFouls(currentValue, side: homeSide)
    }
    
    func calculateFouls(currentValue : Int, side:Sides){
        side.currentFoul = currentValue
        if side.name == "Home"{
            homeFouls.text = "\(currentValue)"
        }else{
            guestFouls.text = "\(currentValue)"
            
        }
    }
    
    
    @IBAction func calculateFoulsGuest(sender: UIStepper) {
        var currentValue = Int(sender.value)
        calculateFouls(currentValue, side: guestSide)
        
    }
    
    
    
    
}

