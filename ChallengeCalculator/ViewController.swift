//
//  ViewController.swift
//  ChallengeCalculator
//
//  Created by Brendon Crowe on 1/6/23.
//

import UIKit

enum ChallengeType {
    case distance, elevation
}

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var metricTextField: UITextField!
    @IBOutlet weak var numberOfWeeksTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    var currentChallengeType = ChallengeType.distance
    
    @IBAction func challengeButtonPressed(_ sender: UIButton) {
        calculateChallenge()
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentChallengeType = .distance
        case 1:
            currentChallengeType = .elevation
        default :
            print("unknown index")
        }
    }
    
    func calculateChallenge() {
        // get the metric and the number of days from the text fields
        guard let metric = Double(metricTextField.text ?? ""),
              let numberOfWeeks = Int(numberOfWeeksTextField.text ?? "") else {
            let uiAlert = UIAlertController.init(title: "Error", message: "Invalid entry", preferredStyle: .alert)
            uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: clearTextFields))
            present(uiAlert, animated: true)
            return
        }
        let challenge = Challenge()
        let weeklyTraining = challenge.calculateWeeklyTraining(for: metric, and: numberOfWeeks)
        
        switch currentChallengeType {
        case .elevation:
            messageLabel.text = "Weekly training: \(weeklyTraining) feet"
        case .distance:
            messageLabel.text = "Weekly training: \(weeklyTraining) miles"
        }
    }
    
    func clearTextFields(alert: UIAlertAction! = nil) {
        metricTextField.text?.removeAll()
        numberOfWeeksTextField.text?.removeAll()
    }
}

