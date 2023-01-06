//
//  ChallengeCalculatorTests.swift
//  ChallengeCalculatorTests
//
//  Created by Brendon Crowe on 1/6/23.
//

import XCTest

// @testable is a compiler directive, which enables this test suite to have access to the all ChallengeCalculator modules, which requires import "SwiftFile"

@testable import ChallengeCalculator

class ChallengeCalculatorTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setUp - called before each test is run")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("tearDown - called after each test is completed")
    }
    
    // for all tests, the compiler requires the prefix "test"
    // test functions do not take any parameters nor does it return any values
    // every edge case (what if?) in the app NEEDS ITS OWN UNIT TEST
    
    func testAddTwoNumbers() {
        
        // arrange the test in the following way...
        
        // 1. arrange (given) - setup constants, variables, and the (System Under Test), which in the case is a function
        let sut = Challenge()
        let num1 = 10
        let num2 = 5
        let expectedResult = 15
        
        // 2. act (when) - perform work load
        let result = sut.addTwoNumber(num1: num1, num2: num2)
        
        // 3. assert (then) - test for given condition
        XCTAssertEqual(expectedResult, result, "\(result) should be \(expectedResult)")
    }
    
    
    func testCalculateWeeklyTraining() {
        // arrange
        let sut = Challenge() // creating an instance of challenge
        let sutExpectedAverage = 2320 // feet elevation per week
        let metric = 11_602 // overall elevation challenge
        let numberOfWeeksForChallenge = 5
        
        // act
        let weeklyTraining = sut.calculateWeeklyTraining(for: Double(metric), and: numberOfWeeksForChallenge)
        
        // assert
        XCTAssertEqual(sutExpectedAverage, weeklyTraining, "\(weeklyTraining) should be \(sutExpectedAverage)")
    }
    
    // TDD - Test Driven Development
    /*
     You start by writing a unit test until it fails (or a compiler error), then go to the production code i.e. Challenge.swift, fix the failure until the test passes, continue writing unit test until failure again and continue the cycle
     */
    
    
    func testWhenZeroIsEntered() {
        let sut = Challenge()
//        let sutExpectedAverage = 2320
        let metric = 11_602
        let numberOfWeeksForChallenge = 0
        let whenZeroIsEntered = -1
        
        let weeklyTraining = sut.calculateWeeklyTraining(for: Double(metric), and: numberOfWeeksForChallenge)
        
        XCTAssertEqual(whenZeroIsEntered, weeklyTraining, "\(whenZeroIsEntered) should be \(weeklyTraining)")
    }
    
    
    func testAverageDailyMetric() {
        // arrange
        let sut = Challenge()
        let sutWeeklyTotalMetric = 2320 // total elevation
        let expectedDailyAverage = 773 // elevation per day
        let numberOfWorkoutDays = 3 // days workedOut
        
        // act
        
        // averageTrainingPerWeek expects to return 773
        let averageDailyTraining = sut.averageTrainingPerWeek(challengeMetric: sutWeeklyTotalMetric, numberOfWorkoutDays: numberOfWorkoutDays)
        
        // assert
        XCTAssertEqual(averageDailyTraining, expectedDailyAverage, "\(averageDailyTraining) should be \(expectedDailyAverage)")
        
    }
}
