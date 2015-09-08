//
//  Scoreboard Brain.swift
//  Basketball Scoreboard
//
//  Created by Rudy E. Matos Perez on 9/5/15.
//  Copyright (c) 2015 Rudy Matos. All rights reserved.
//

import Foundation

enum Points : Int {
    case Three = 3
    case Two = 2
    case One = 1
    case MinusOne = -1
}

enum Fouls : Int{
    case One = 1
    case MinusOne = -1
}

class ScoreboardBrain{
    
    func calculatePoints(points: Points,side:Sides){
        side.currentScore += points.rawValue
        if side.currentScore < 0 {
            side.currentScore = 0;
        }
        //TODO check when points is equals to minus 1. Use a different Logic
    }
    
    func calculateFoul(foul: Fouls,side:Sides){
        side.currentFoul += foul.rawValue
        if side.currentFoul < 0 {
            side.currentFoul = 0
        }
        //TODO check when points is equals to minus 1. Use a different Logic
    }
}