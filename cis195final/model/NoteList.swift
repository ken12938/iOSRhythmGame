//
//  NoteList.swift
//  cis195final
//
//  Created by Kenny Chen on 4/16/19.
//  Copyright © 2019 Kenny Chen. All rights reserved.
//

import Foundation

struct NoteList {
    var noteList: [Note]
    var index: Int
    
    init(songIndex: Int) {
        index = 0
        if(songIndex == 0) {
            noteList =  //Intro part
                        [Note(startTime: 0.1, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 0.6, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 1.1, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 1.6, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 2.1, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 2.105, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 3.5, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 3.6, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 3.75, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 4.25, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 4.5, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 5.25, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 5.45, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 5.455, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 7.1, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 7.51, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 7.92, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 8.34, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 8.8, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 8.805, xPos: 400, noteType: NoteType.circ),
                        //Calm part
                        Note(startTime: 10.4, xPos: 375, noteType: NoteType.circ),
                        Note(startTime: 10.405, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 10.81, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 11.22, xPos: 220, noteType: NoteType.circ),
                        Note(startTime: 11.64, xPos: 375, noteType: NoteType.circ),
                        Note(startTime: 12.15, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 12.155, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 13.85, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 13.855, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 15.6, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 15.605, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 16.8, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 17.25, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 17.255, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 18.35, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 18.75, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 18.95, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 18.955, xPos: 400, noteType: NoteType.circ),
                        //Quarter note part
                        Note(startTime: 20.7, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 20.705, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 21.13, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 21.56, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 21.99, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 22.42, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 22.425, xPos: 100, noteType: NoteType.circ),
                        Note(startTime: 22.85, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 23.28, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 23.71, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 24.13, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 24.135, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 24.55, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 24.98, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 25.4, xPos: 150, noteType: NoteType.circ),
                        //Build up part
                        Note(startTime: 25.83, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 25.835, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 26.04, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 26.25, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 26.255, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 26.47, xPos: 225, noteType: NoteType.circ),
                        Note(startTime: 26.68, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 26.685, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 26.9, xPos: 375, noteType: NoteType.circ),
                        Note(startTime: 27.11, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 27.115, xPos: 450, noteType: NoteType.circ),
                        //
                        Note(startTime: 27.54, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 27.545, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 27.76, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 27.97, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 27.975, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 28.38, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 28.59, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 28.595, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 28.8, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 29.01, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 29.015, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 29.23, xPos: 325, noteType: NoteType.circ),
                        //
                        Note(startTime: 29.44, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 29.445, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 29.86, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 30.0, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 30.28, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 30.285, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 30.42, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 30.71, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 30.715, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 30.93, xPos: 300, noteType: NoteType.circ),
                        //
                        Note(startTime: 31.15, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 31.36, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 31.365, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 31.57, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 31.575, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 31.71, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 31.79, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 32.0, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 32.21, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 32.42, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 32.425, xPos: 300, noteType: NoteType.circ),
                        //
                        Note(startTime: 32.85, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 32.855, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 33.27, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 33.275, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 33.55, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 33.7, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 33.705, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 33.98, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 34.12, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 34.125, xPos: 375, noteType: NoteType.circ),
                        //
                        Note(startTime: 34.55, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 34.555, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 34.97, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 35.18, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 35.39, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 35.61, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 35.82, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 36.11, xPos: 150, noteType: NoteType.circ),
                        //
                        Note(startTime: 36.26, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 36.265, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 36.68, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 36.90, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 37.01, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 37.12, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 37.33, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 37.54, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 37.68, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 37.82, xPos: 450, noteType: NoteType.circ),
                        //
                        Note(startTime: 37.96, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 37.96, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 38.1, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 38.24, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 38.37, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 38.51, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 38.65, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 38.79, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 38.93, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 39.07, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 39.22, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 39.36, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 39.51, xPos: 325, noteType: NoteType.circ),
                        //Main melody
                        Note(startTime: 39.66, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 40.3, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 40.51, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 40.515, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 41.25, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 41.36, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 41.36, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 41.57, xPos: 175, noteType: NoteType.circ),
                        Note(startTime: 41.79, xPos: 225, noteType: NoteType.circ),
                        Note(startTime: 42, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 42.21, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 42.21, xPos: 150, noteType: NoteType.circ),
                        //
                        Note(startTime: 43.06, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 43.065, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 43.7, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 43.705, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 43.91, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 43.915, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 44.76, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 45.18, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 45.5, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 45.6, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 45.8, xPos: 200, noteType: NoteType.circ),
                        //
                        Note(startTime: 46.47, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 46.47, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 47.11, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 47.32, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 47.325, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 48.06, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 48.17, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 48.175, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 48.38, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 48.59, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 48.81, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 49.02, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 49.025, xPos: 150, noteType: NoteType.circ),
                        //
                        Note(startTime: 49.87, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 49.875, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 50.21, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 50.215, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 50.72, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 50.725, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 51.57, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 51.99, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 52.31, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 52.41, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 52.61, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 52.61, xPos: 400, noteType: NoteType.circ),
                        //
                        Note(startTime: 53.27, xPos: 200, noteType: NoteType.circ)]
            
            
        } else if(songIndex == 1) {
            noteList = [Note(startTime: 1.0, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 1.48, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 1.96, xPos: 225, noteType: NoteType.circ),
                        Note(startTime: 2.44, xPos: 175, noteType: NoteType.circ),
                        Note(startTime: 4.84, xPos: 175, noteType: NoteType.circ),
                        Note(startTime: 5.32, xPos: 225, noteType: NoteType.circ),
                        Note(startTime: 5.8, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 6.28, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 7.72, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 7.72, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 8.2, xPos: 225, noteType: NoteType.circ),
                        Note(startTime: 8.2, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 8.68, xPos: 175, noteType: NoteType.circ),
                        Note(startTime: 8.68, xPos: 375, noteType: NoteType.circ),
                        Note(startTime: 9.16, xPos: 225, noteType: NoteType.circ),
                        Note(startTime: 9.16, xPos: 425, noteType: NoteType.circ),
                        Note(startTime: 9.64, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 9.76, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 9.88, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 10.12, xPos: 375, noteType: NoteType.circ),
                        Note(startTime: 10.12, xPos: 225, noteType: NoteType.circ),
                        Note(startTime: 10.60, xPos: 325, noteType: NoteType.circ),
                        Note(startTime: 10.84, xPos: 225, noteType: NoteType.circ),
                        Note(startTime: 11.08, xPos: 275, noteType: NoteType.circ),
                        Note(startTime: 11.08, xPos: 175, noteType: NoteType.circ),
                        Note(startTime: 11.56, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 12.04, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 12.52, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 12.52, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 12.88, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 13, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 13.36, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 13.48, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 13.84, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 13.96, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 13.96, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 14.44, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 14.44, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 14.92, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 14.92, xPos: 400, noteType: NoteType.circ),
                        //
                        Note(startTime: 17.08, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 17.32, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 17.32, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 17.8, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 17.8, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 18.28, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 18.28, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 18.76, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 18.76, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 18.88, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 19, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 19.24, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 19.24, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 19.48, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 19.72, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 19.72, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 20.2, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 20.2, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 20.68, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 20.68, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 20.8, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 20.92, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 21.16, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 21.16, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 21.64, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 21.64, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 21.76, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 21.88, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 22.12, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 22.6, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 22.6, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 22.84, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 23.08, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 23.08, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 23.56, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 23.56, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 24.04, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 24.04, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 24.16, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 24.28, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 25, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 25, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 25.48, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 25.96, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 25.96, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 26.44, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 26.44, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 26.56, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 26.68, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 26.92, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 26.92, xPos: 150, noteType: NoteType.circ),
                        Note(startTime: 27.4, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 27.4, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 27.64, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 27.88, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 27.88, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 28.12, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 28.36, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 28.36, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 28.84, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 28.84, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 29.08, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 29.2, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 29.32, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 29.32, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 29.8, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 29.8, xPos: 350, noteType: NoteType.circ),
                        Note(startTime: 30.24, xPos: 100, noteType: NoteType.circ),
                        Note(startTime: 30.24, xPos: 450, noteType: NoteType.circ),
                        Note(startTime: 30.72, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 31.2, xPos: 100, noteType: NoteType.circ),
                        Note(startTime: 31.2, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 31.44, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 31.44, xPos: 400, noteType: NoteType.circ),
                        //Calm part
                        Note(startTime: 33.12, xPos: 100, noteType: NoteType.circ),
                        Note(startTime: 33.6, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 34.08, xPos: 300, noteType: NoteType.circ),
                        Note(startTime: 34.56, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 35.04, xPos: 100, noteType: NoteType.circ),
                        Note(startTime: 35.52, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 36, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 36.48, xPos: 100, noteType: NoteType.circ),
                        Note(startTime: 38.88, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 39.36, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 39.84, xPos: 200, noteType: NoteType.circ),
                        Note(startTime: 40.32, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 40.8, xPos: 100, noteType: NoteType.circ),
                        Note(startTime: 41.28, xPos: 400, noteType: NoteType.circ),
                        Note(startTime: 41.76, xPos: 250, noteType: NoteType.circ),
                        Note(startTime: 42.24, xPos: 350, noteType: NoteType.circ)]
        }else {
            noteList = []
        }
    }

}
