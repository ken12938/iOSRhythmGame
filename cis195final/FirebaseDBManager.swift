//
//  FirebaseDBManager.swift
//  cis195final
//
//  Created by Kenny Chen on 4/23/19.
//  Copyright © 2019 Kenny Chen. All rights reserved.
//

import Foundation
import Firebase

struct FirebaseDBManager {

    private static let statsRef = Database.database().reference(withPath: "/")
    
    static func pullStats(songId: Int, callback: @escaping (Int, Int) -> ()) {
        statsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // TIP: print snapshot here to see what the returned data looks like.
            for case let statsSnapshot as DataSnapshot in snapshot.children { // for each coffee_shops entry
                
                let stats = statsSnapshot.value as! [Any]
                let currSongStats = stats[songId] as! [String: Any]
                let highScore = currSongStats["highScore"] as! Int
                let maxCombo = currSongStats["maxCombo"] as! Int
                callback(highScore, maxCombo)
            }
        })
    }
    
    static func updateHighScore(songId: Int, score: Int) {
        statsRef.child("stats").child(String(songId)).child("highScore").setValue(score)
    }
    
    static func updateMaxCombo(songId: Int, maxCombo: Int) {
        statsRef.child("stats").child(String(songId)).child("maxCombo").setValue(maxCombo)
    }
}
