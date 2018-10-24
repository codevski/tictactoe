//
//  ViewController.swift
//  tictactoe
//
//  Created by Sash Petrovski on 11/10/18.
//  Copyright © 2018 Bamello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cross = 2
    let circle = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winStates = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5, 8], [0,4,8], [2,4,6]]
    var activeGame = true
    var totalMoves = 0
    var winner = ""
    
    var playersTurn: Int = 2
    
    var crossIMG = UIImage(named: "cross.png")
    let circleIMG = UIImage(named: "nought.png")
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBAction func button1(_ sender: UIButton) {
        let currentPosition = sender.tag - 1
        if activeGame {
            if gameState[currentPosition] == 0 && activeGame {
                sender.setImage(checkPlayer(currentPosition: currentPosition), for: [])
                totalMoves += 1
                checkWinner()
            }
            
            if totalMoves == 9 && activeGame {
                winner = "Its a Draw!"
                activeGame = false
                fadeIn(winner: winner)
            }
        }
    }
    
    func checkWinner() { // Needs Working
        // Check Horizontal
        for combinations in winStates {
            if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] {
                activeGame = false
                fadeIn(winner: winner)
            }
        }
    }
    
    func fadeIn(winner:String) { // fade in effect
        winnerLabel.text = winner
        
        winnerLabel.alpha = 0
        playAgainBtn.alpha = 0
        
        winnerLabel.isHidden = false
        playAgainBtn.isHidden = false
        
        UIView.animate(withDuration: 1, animations: {
            self.winnerLabel.alpha = 1
        })
        UIView.animate(withDuration: 1, animations: {
            self.playAgainBtn.alpha = 1
        })
    }
    
    func checkPlayer (currentPosition: Int) -> UIImage {
        if playersTurn == cross {
            playersTurn = circle
            winner = "X Won!"
            gameState[currentPosition] = cross
            return crossIMG!
        } else {
            playersTurn = cross
            winner = "O Won!"
            gameState[currentPosition] = circle
            return circleIMG!
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        winnerLabel.isHidden = true
        playAgainBtn.isHidden = true
        activeGame = true
        playersTurn = cross
        totalMoves = 0
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1...9 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
//        if let button = view.viewWithTag(7) as? UIButton {
//            button.setImage(nil, for: [])
//        }
//        if let button = view.viewWithTag(8) as? UIButton {
//            button.setImage(nil, for: [])
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        playAgainBtn.isHidden = true
        
//        winnerLabel.layer.zPosition = 1
//        playAgainBtn.layer.zPosition = 1
        
    }
    
    
}

