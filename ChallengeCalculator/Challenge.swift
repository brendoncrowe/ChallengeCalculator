//
//  Challenge.swift
//  ChallengeCalculator
//
//  Created by Brendon Crowe on 1/6/23.
//

import Foundation

struct Challenge {
    
    // this function is to illustrate unit testing - not a part of the app
    func addTwoNumber(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    func calculateWeeklyTraining(for metric: Double, and weeks: Int) -> Int {
        
        // refactor to guard against division by 0 weeks
        guard weeks > 0 else { return 0 }
        return Int(metric) / weeks // average metric (elevation or distance) per week
    }
    
    func averageTrainingPerWeek(challengeMetric: Int, numberOfWorkoutDays: Int ) -> Int {
        
        // guard for valid days of the week 1...7
        guard (1...7).contains(numberOfWorkoutDays) else { return 0 }
        return challengeMetric / numberOfWorkoutDays
    }
}
