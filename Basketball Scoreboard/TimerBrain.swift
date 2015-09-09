//
//  TimerBrain.swift
//  Basketball Scoreboard
//
//  Created by Rudy E. Matos Perez on 9/8/15.
//  Copyright (c) 2015 Rudy Matos. All rights reserved.
//

import Foundation

class TimerBrain{
    
    var minutes = 0;
    var seconds = 0;
    var isTimerDone = false
    
    func calculateTime(){
        
        if seconds >= 0{
            seconds--
        }
        if seconds == -1 && minutes >= 0{
            minutes--
            seconds = 59
        }
        if minutes == 0 && seconds == 0{
            isTimerDone = true
        }
    }
    
    func getFixedTime() -> String{
        return String(format: "%02d",minutes) + ":" + String(format: "%02d", seconds)
    }
}