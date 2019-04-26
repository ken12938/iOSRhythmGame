//
//  SongViewController.swift
//  cis195final
//
//  Created by Kenny Chen on 4/11/19.
//  Copyright © 2019 Kenny Chen. All rights reserved.
//


import Foundation
import UIKit
import AVFoundation

class SongViewController: UIViewController {
    
    var player: AVPlayer?
    var noteList: NoteList?
    var timeObserverToken: Any?
    
    var singleTouchGestureRecognizer: UITapGestureRecognizer?
    var doubleTouchGestureRecognizer: UITapGestureRecognizer?
    
    var score: Int?
    var combo: Int?
    var maxCombo: Int?
    var notesHit: Int?

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var comboLabel: UILabel!
   
    @IBOutlet weak var hitBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initNoteList()
        addGestureRecognizers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        playSong()
        createNotes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let timeObserverToken = timeObserverToken {
            player!.removeTimeObserver(timeObserverToken)
            self.timeObserverToken = nil
        }
        
        self.player?.pause()
        
        //Record score and combo
        if segue.identifier == "showResults" {
            ResultsViewController.score = score
            ResultsViewController.maxCombo = maxCombo
            ResultsViewController.notesHit = notesHit
            ResultsViewController.totalNotes = noteList!.noteList.count
        }
    }
    
    func initUI() {
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
        
        //Giving shadow to hitbar
        hitBar.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        hitBar.layer.shadowOpacity = 0.7
        hitBar.layer.shadowRadius = 6.0
        
        //Resetting combo and score labels to 0
        score = 0
        scoreLabel.text = "Score: " + String(score!)
        combo = 0
        comboLabel.text = "Combo: " + String(combo!)
        maxCombo = 0
        notesHit = 0
    }
    
    func initNoteList() {
        noteList = NoteList(songIndex: SongList.currSong.id)
    }
    
    func playSong() {
        
        guard var url = Bundle.main.url(forResource: "serotonin_someone-like-you", withExtension: "mp3") else { return }
        if(SongList.currSong.id == 0) {
            url = Bundle.main.url(forResource: "serotonin_someone-like-you", withExtension: "mp3")!
        } else if(SongList.currSong.id == 1) {
            url = Bundle.main.url(forResource: "More", withExtension: "mp3")!
        }
        self.player = AVPlayer(url: url)
        self.player?.play()
    }
    
    func createNotes() {
        // Invoke callback every 5 millisecond
        let interval = CMTime(seconds: 0.005,
                              preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        // Queue on which to invoke the callback
        let mainQueue = DispatchQueue.main
        // Add time observer
        //let timeObserverToken =
        timeObserverToken = player!.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue) {
            [weak self] time in
            
            if(self != nil) {
                var nl = self!.noteList!
                
                if(nl.index < nl.noteList.count) {
                    let nextNoteTime = nl.noteList[nl.index].startTime
                    
                    if(nextNoteTime < time.seconds + 0.002) {
                        //Adding the note to the game
                        let noteImage = UIImage(named: "circle")
                        let noteImageView = UIImageView()
                        self!.view.addSubview(noteImageView)
                        noteImageView.translatesAutoresizingMaskIntoConstraints = false
                        noteImageView.image = noteImage
                        noteImageView.leftAnchor.constraint(equalTo: self!.view.leftAnchor, constant: CGFloat(nl.noteList[nl.index].xPos)).isActive = true
                        noteImageView.topAnchor.constraint(equalTo: self!.view.topAnchor, constant: CGFloat(-50.0)).isActive = true
                        noteImageView.widthAnchor.constraint(equalToConstant: CGFloat(50.0)).isActive = true
                        noteImageView.heightAnchor.constraint(equalToConstant: CGFloat(50.0)).isActive = true
                        
                        //Start moving notes down
                        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveLinear, animations: {
                            noteImageView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height + 100)
                        }) { _ in
                            if(noteImageView.superview != nil) {
                                noteImageView.removeFromSuperview()
                                self?.resetCombo()
                            }
                        }
                        
                        //Incrementing which note we are looking for
                        nl.index = nl.index + 1
                        
                    }
                    
                    self?.noteList?.index = nl.index
                }
            }
            
        }
    }
    
    func addGestureRecognizers() {
        self.view.isUserInteractionEnabled = true
        self.view.isMultipleTouchEnabled = true
        
        //Single touch gesture recognizer
        singleTouchGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(tapGestureRecognizer:)))
        self.view.addGestureRecognizer(singleTouchGestureRecognizer!)
        
        //Double touch gesture recognizer
        doubleTouchGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(tapGestureRecognizer: )))
        doubleTouchGestureRecognizer!.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(doubleTouchGestureRecognizer!)
    }
    
    //will check if any of the circle notes on screen are near the bar
    @objc func tapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        //Handles tap gesture for single and double touch
        for i in 1...tapGestureRecognizer.numberOfTouches {
        
            //Coordinates of tap
            let x = tapGestureRecognizer.location(ofTouch: i - 1, in: self.view).x
            let y = tapGestureRecognizer.location(ofTouch: i - 1, in: self.view).y
            
            var noteTapped = false
            
            for note in self.view.subviews.filter({$0 is UIImageView}) {
                
                //Need to find coordinates of presentation layer of note
                if let minX = note.layer.presentation()?.frame.minX {
                    let maxX = note.layer.presentation()?.frame.maxX as! CGFloat
                    let minY = note.layer.presentation()?.frame.minY as! CGFloat
                    let maxY = note.layer.presentation()?.frame.maxY as! CGFloat
                    
                    //Check if tap is within note
                    if(x >= minX - 40 && x <= maxX + 40 && y >= minY - 40 && y <= maxY + 40) {
                    
                        //Check if note overlaps with hit bar
                        if(minY <= CGFloat(310.0) && maxY >= CGFloat(330.0)) {
                            
                            //Confirms that note is tapped
                            noteTapped = true
                            
                            //Update score
                            score = score! + Int(40*(1 + 0.1*(Double(combo!).squareRoot())))
                            
                            //Update combo
                            combo = combo! + 1
                            
                            //Update notes hit
                            notesHit = notesHit! + 1
                            
                            note.removeFromSuperview()
                        } else if(minY <= CGFloat(320.0) && maxY >= CGFloat(320.0)) { //More lenient check, but less points added to score
                            
                            //Confirms that note is tapped
                            noteTapped = true
                            
                            score = score! + Int(30*(1 + 0.08*(Double(combo!).squareRoot())))
                            combo = combo! + 1
                            notesHit = notesHit! + 1
                            
                            note.removeFromSuperview()
                        } else if(minY <= CGFloat(330.0) && maxY >= CGFloat(310.0)) { //More lenient check, but less points added to score
                            
                            noteTapped = true
                            
                            score = score! + Int(20*(1 + 0.06*(Double(combo!).squareRoot())))
                            combo = combo! + 1
                            notesHit = notesHit! + 1
                            
                            note.removeFromSuperview()
                        }
                        
                        scoreLabel.text = "Score: " + String(score!)
                        comboLabel.text = "Combo: " + String(combo!)
                    }
                }
                
                //Makes sure that every tap can only register with one note
                if(noteTapped) {
                    break
                }
            }
            
            //Reset combo if no note is tapped
            if(!noteTapped) {
                resetCombo()
            }
            
        }
        
        if(combo! > maxCombo!) {
            maxCombo = combo
        }
    }
    
    func resetCombo() {
        combo = 0
        comboLabel.text = "Combo: " + String(combo!)
    }
}
