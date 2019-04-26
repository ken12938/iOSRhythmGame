//
//  Song.swift
//  cis195final
//
//  Created by Kenny Chen on 4/11/19.
//  Copyright © 2019 Kenny Chen. All rights reserved.
//

import Foundation

class Song: NSObject {
    
    var id: Int
    var name: String!
    var artist: String!
    
    init(id: Int, name: String, artist: String) {
        self.id = id
        self.name = name
        self.artist = artist
    }
}
