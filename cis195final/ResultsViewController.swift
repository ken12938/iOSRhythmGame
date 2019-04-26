//
//  ResultsViewController.swift
//  cis195final
//
//  Created by Kenny Chen on 4/12/19.
//  Copyright © 2019 Kenny Chen. All rights reserved.
//

import Foundation

import UIKit



class ResultsViewController: UIViewController {

    static var score: Int?
    static var maxCombo: Int?
    static var notesHit: Int?
    static var totalNotes: Int?
    
    @IBOutlet weak var comboLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var notesHitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        displayStats()
        recordStats()
    }
    
    func setBackground() {
        // set a background color using gradients
        let colorRight = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        let colorLeft = UIColor(red: 92.0/255.0, green: 92.0/255.0, blue: 214.0/255.0, alpha: 1.0)
        
        let gl = CAGradientLayer()
        gl.colors = [colorLeft.cgColor, colorRight.cgColor]
        gl.locations = [0.0, 1.0]
        gl.startPoint = CGPoint(x: 0.5, y: 0.0)
        gl.endPoint = CGPoint(x: 0.5, y: 1.0)
        gl.frame = self.view.bounds
        self.view.layer.insertSublayer(gl, at: 0)
    }
    
    func displayStats() {
        
        scoreLabel.text = "Score: " + String(ResultsViewController.score!)
        comboLabel.text = "Max Combo: " + String(ResultsViewController.maxCombo!)
        notesHitLabel.text = "Notes Hit: " + String(ResultsViewController.notesHit!) + "/" + String(ResultsViewController.totalNotes!)
    }
    
    func recordStats() {
        FirebaseDBManager.pullStats(songId: SongList.currSong.id) {(highScore: Int, maxCombo: Int) -> () in
            if(ResultsViewController.score! > highScore) {
                FirebaseDBManager.updateHighScore(songId: SongList.currSong.id, score: ResultsViewController.score!)
            }
            if(ResultsViewController.maxCombo! > maxCombo) {
                FirebaseDBManager.updateMaxCombo(songId: SongList.currSong.id, maxCombo: ResultsViewController.maxCombo!)
            }
        }
    }
}
