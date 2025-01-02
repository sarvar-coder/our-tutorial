//
//  ViewController.swift
//  Section1
//
//  Created by Sarvar Boltaboyev on 13/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    var arrOfUser = [String]()
    var arrOfScore = [Int]()
    var score = 0
    var round = 0
    var points = 0
    var difference = 0
    var currentValue = 0
    var targetValue = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage( named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)  
    }
    
    @IBAction func showAlert() {
        difference = abs(currentValue - targetValue)
        points = 100 - difference
        
        // add these lines
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        }
        else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points" // chapter 4
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) // chapter 3 changed
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.startNewRound()
            
        }) // chapter 3 changed "Ok"
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {  // chapter 3 added
        currentValue = lroundf(slider.value)
    }
    @IBAction func startOver(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Congrats", message: "Enter your name", preferredStyle: .alert)
        
        alert.addTextField()
        
        let action = UIAlertAction(title: "Save", style: .default, handler: { _ in
            
            let name = alert.textFields![0].text
            
            
            if let name = name {
                self.arrOfUser.append(name)
                
            }
            self.arrOfScore.append(self.score)
            
            self.startOver()
        })
        
        print(arrOfUser)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func leaderShip(_ sender: Any) {
    }
    
    func startNewRound() {  // aded chapter 4
        
        // Add the following lines
          let transition = CATransition()
          transition.type = CATransitionType.fade
          transition.duration = 1
          transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
          view.layer.add(transition, forKey: nil)
        
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        score += points
        round += 1
        
        updateLabels() // Add this line
    }
    func startOver() {
        roundLabel.text = "1"
        scoreLabel.text = "0"
        
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

