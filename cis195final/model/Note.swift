//
//  Note.swift
//  cis195final
//
//  Created by Kenny Chen on 4/16/19.
//  Copyright © 2019 Kenny Chen. All rights reserved.
//

import Foundation

class Note: NSObject {
    
    
    var startTime: Double //in seconds
    var xPos: Int
    var noteType: NoteType
    
    init(startTime: Double, xPos: Int, noteType: NoteType) {
        self.startTime = startTime
        self.xPos = xPos
        self.noteType = noteType
    }
}

enum NoteType {
    case circ //Circle, the normal note
    case dir //Directional note
}
