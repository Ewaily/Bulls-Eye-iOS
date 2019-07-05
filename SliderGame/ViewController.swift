//
//  ViewController.swift
//  SliderGame
//
//  Created by Muhammad Ewaily on 6/30/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let scoreValue = 100
    private var level = 0, score = 0, round = 0
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDisplay()
    }

    func setLevel () {
        level = Int.random(in: 1...100)
        levelLabel.text = String(level)
    }
    
    func setRound () {
        round += 1
        roundLabel.text = String(round)
    }
    
    func setScore () {
        if ((level - 2)...(level + 2) ~= Int(slider.value)){
            setWinnerState()
        }
        else {
            setLoserState()
        }
    }
    
    func setWinnerState () {
        score += scoreValue
        let alert = UIAlertController(title: "Winner", message: "Congratulations, You win!\nYou got \(score) point", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        scoreLabel.text = String(score)
        setDisplay()
    }
    
    func setLoserState () {
        let alert = UIAlertController(title: "Loser", message: "You failed!, try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func setDisplay () {
        setRound()
        setLevel()
    }
    
    func resetDisplay () {
        score = 0
        scoreLabel.text = String(score)
        round = 0
        setDisplay()
    }
    
    @IBAction func hiteMeButton(_ sender: UIButton) {
        setScore()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Start Over", message: "Are you sure?", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "Yes", style: .destructive, handler: {
            action in
            self.resetDisplay()
        })
        
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
    
        alert.addAction(cancel)
        alert.addAction(confirm)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func helpButton(_ sender: UIButton) {
    }
}

