//
//  SongList.swift
//  cis195final
//
//  Created by Kenny Chen on 4/11/19.
//  Copyright © 2019 Kenny Chen. All rights reserved.
//

import Foundation

struct SongList {
    static var songList: [Song]!

    static var currSong: Song!
    static var firstSongOffset: Int! //First song's row index in table view
    
    static func initSongList() {
        songList = [Song(id: 0, name: "Someone Like You", artist: "Serotonin"),
                    Song(id: 1, name: "More", artist: "Usher"),
                    Song(id: 2, name: "Song 3", artist: ""),
                    Song(id: 3, name: "Song 4", artist: ""),
                    Song(id: 4, name: "Song 5", artist: ""),
                    Song(id: 5, name: "Song 6", artist: ""),
                    Song(id: 6, name: "Song 7", artist: ""),
                    Song(id: 7, name: "Song 8", artist: ""),
                    Song(id: 8, name: "Song 9", artist: "")]
        currSong = songList[0]
        firstSongOffset = 2
    }
}
