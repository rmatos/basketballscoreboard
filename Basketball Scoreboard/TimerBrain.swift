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
        
        //TODO check calculatetime logic. Is creating a mess
        if seconds != 0{
            --seconds
        }
        
        if seconds == 0 && minutes > 0{
            --minutes
        }
        
        println("\(minutes):\(seconds)")
        
        if minutes == 0 && seconds == 0{
            println("Timer is done")
            isTimerDone = true
        }
        
        if minutes != 0 && seconds == 0{
            seconds = 59
        }
    }
    
    func getFixedTime() -> String{
        return String(format: "%02d",minutes) + ":" + String(format: "%02d", seconds)
    }
    
}