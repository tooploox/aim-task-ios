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
    let playTime: String
    let duration: String
    let imageURL: URL?
    let status: TrackStatus
    let type: TrackType
}

extension Track {
    
    static func fromAttributeDict(attributeDict: [String: String]) -> Track? {
        guard
            let title = attributeDict["title"],
            let artist = attributeDict["artist"],
            let album = attributeDict["album"],
            let playTime = attributeDict["time"],
            let duration = attributeDict["duration"],
            let imageURLString = attributeDict["imageUrl"],
            let statusString = attributeDict["status"],
            let typeString = attributeDict["type"]
        else {
            assertionFailure("Cannot parse Track data")
            return nil
        }
        
        var status: TrackStatus
        switch statusString {
            case "history":
                status = .history
            case "playing":
                status = .playing
            default:
                assertionFailure("Cannot parse Track data")
                return nil
        }
        
        var type: TrackType
        switch typeString {
            case "song":
                type = .song
            default:
                assertionFailure("Cannot parse Track data")
                return nil
        }
        
        return Track(
            title: title,
            artist: artist,
            album: album,
            playTime: playTime,
            duration: duration,
            imageURL: URL(string: imageURLString),
            status: status,
            type: type
        )
    }
}
