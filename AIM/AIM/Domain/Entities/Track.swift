//
//  Track.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import Foundation

enum TrackStatus {
    case history
    case playing
}

enum TrackType {
    case song
}

struct Track {
    
    let title: String
    let artist: String
    let album: String
    let playTime: Date
    let duration: String
    let imageURL: URL
    let status: TrackStatus
    let type: TrackType
}
