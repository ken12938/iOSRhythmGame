//
//  MenuViewController.swift
//  cis195final
//
//  Created by Kenny Chen on 4/9/19.
//  Copyright © 2019 Kenny Chen. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    let circleView : UIView = {
        let c = UIView()
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    
    let songLabel : UILabel = {
        let sl = UILabel()
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    let artistLabel : UILabel = {
        let al = UILabel()
        al.translatesAutoresizingMaskIntoConstraints = false
        return al
    }()
    
    let highScoreLabel : UILabel = {
        let sl = UILabel()
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    let maxComboLabel : UILabel = {
        let sl = UILabel()
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    let playButton : UIButton = {
        let pb = UIButton()
        pb.translatesAutoresizingMaskIntoConstraints = false
        return pb
    }()
    
    @objc func pressed(sender: UIButton!) {
        //Segue will be aborted if currSong.id is not 0 or 1
        if(SongList.currSong.id == 0 || SongList.currSong.id == 1){
            self.performSegue(withIdentifier: "play", sender: sender)
        }
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        displayStats()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SongList.initSongList()
        
        //building UI elements
        setBackground()
        addTableView()
        addCircle()
        addPlayButton()
    }
    
    // Note: because this is NOT a subclassed UITableViewController,
    // DataSource and Delegate functions are NOT overridden
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return max(4+SongList.songList.count, 14)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "cell")
        
        let redVal = 0
        let greenVal = 0.5 + Double(indexPath.row % 4) * 0.05
        let blueVal = 0.2 - Double(indexPath.row % 4) * 0.03
        
        cell.backgroundColor = UIColor.init(displayP3Red: CGFloat(redVal), green: CGFloat(greenVal), blue: CGFloat(blueVal), alpha: 0.4)
        
        if(indexPath.row >= SongList.firstSongOffset && indexPath.row < 2+SongList.songList.count) {
            
            cell.textLabel?.text = SongList.songList[indexPath.row-2].name
            cell.detailTextLabel?.text = SongList.songList[indexPath.row-2].artist
            cell.textLabel?.textAlignment = .right
            cell.textLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        }
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row >= SongList.firstSongOffset && indexPath.row < 2+SongList.songList.count) {
            SongList.currSong = SongList.songList[indexPath.row-SongList.firstSongOffset]
            songLabel.text = SongList.currSong.name
            artistLabel.text = SongList.currSong.artist == "" ? "" : "by " + SongList.currSong.artist
            
            displayStats()
        }
    }
    
    func setBackground() {
        // set a background color using gradients
        let colorRight = UIColor(red: 0.0, green: 0.0, blue: 0.4, alpha: 1.0)
        let colorLeft = UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 1.0)
        
        let gl = CAGradientLayer()
        gl.colors = [colorLeft.cgColor, colorRight.cgColor]
        gl.locations = [0.0, 1.0]
        gl.startPoint = CGPoint(x: 0.0, y: 0.0)
        gl.endPoint = CGPoint(x: 1.2, y: 0.8)
        gl.frame = self.view.bounds
        self.view.layer.insertSublayer(gl, at: 0)
    }
    
    func addCircle() {
        
        self.view.addSubview(circleView)
        
        circleView.backgroundColor = UIColor(red: 26.0/255.0, green: 209.0/255.0, blue: 1.0, alpha: 0.7)
        
        circleView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35.0).isActive = true
        circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60.0).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 240.0).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 240.0).isActive = true
        
        circleView.layer.cornerRadius = 120.0
        circleView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        circleView.layer.shadowOpacity = 0.5
        circleView.layer.shadowRadius = 5.0
        
        
        //Adding label at the top that tells you the song name
        circleView.addSubview(songLabel)
        songLabel.frame = circleView.frame
        songLabel.textAlignment = .center
        songLabel.textColor = UIColor.white
        songLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 24)
        songLabel.text = SongList.currSong.name
        songLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        songLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: -70.0).isActive = true
        songLabel.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        songLabel.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
        
        circleView.addSubview(artistLabel)
        artistLabel.frame = circleView.frame
        artistLabel.textAlignment = .center
        artistLabel.textColor = UIColor.white
        artistLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
        artistLabel.text = "by " + SongList.currSong.artist
        artistLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        artistLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: -50.0).isActive = true
        artistLabel.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        //Adding label in the middle that tells you your high score
        circleView.addSubview(highScoreLabel)
        highScoreLabel.frame = circleView.frame
        highScoreLabel.textAlignment = .left
        highScoreLabel.textColor = UIColor.white
        highScoreLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
        highScoreLabel.text = "High Score: TODO"
        highScoreLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor, constant: 0.0).isActive = true
        highScoreLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: 0.0).isActive = true
        highScoreLabel.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        highScoreLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        
        //Adding label in the middle that tells you your max combo
        circleView.addSubview(maxComboLabel)
        maxComboLabel.frame = circleView.frame
        maxComboLabel.textAlignment = .left
        maxComboLabel.textColor = UIColor.white
        maxComboLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
        maxComboLabel.text = "Max Combo: TODO"
        maxComboLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor, constant: 0.0).isActive = true
        maxComboLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: 25.0).isActive = true
        maxComboLabel.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        maxComboLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        
        displayStats()
        
    }
    
    func addPlayButton() {
        self.view.addSubview(playButton)
        
        playButton.backgroundColor = UIColor(red: 133.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 0.9)
        
        //playButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80.0).isActive = true
        playButton.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50.0).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 130.0).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        
        playButton.layer.cornerRadius = 25.0
        playButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        playButton.layer.shadowOpacity = 0.4
        playButton.layer.shadowRadius = 3.0
        
        playButton.setTitle("Play", for: .normal)
        
        playButton.addTarget(self, action:#selector(self.pressed), for: .touchUpInside)
    }
    
    func addTableView() {
        // add the table view to self.view
        self.view.addSubview(tableView)
        
        tableView.widthAnchor.constraint(equalToConstant: 225.0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -93.0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -125.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 93.0).isActive = true
        
        tableView.transform = CGAffineTransform(rotationAngle: .pi/6*1)
        
        // set delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // register a defalut cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func displayStats() {
        //Getting high score and max combo
        FirebaseDBManager.pullStats(songId: SongList.currSong.id) { (highScore: Int, maxCombo: Int) -> () in
            self.highScoreLabel.text = "High Score: " + String(highScore)
            self.maxComboLabel.text = "Max Combo: " + String(maxCombo)
        }
    }
}
