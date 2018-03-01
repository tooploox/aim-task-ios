//
//  StationInfo.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import Foundation

struct StationInfo {
    
    let name: String
    let description: String
    let time: String
    let duration: String
    let presenter: String
    let imageURL: URL?
    let displayTime: String?
}

extension StationInfo {
    
    static func fromAttributeDict(attributeDict: [String: String]) -> StationInfo? {
        guard
            let name = attributeDict["name"],
            let description = attributeDict["description"],
            let time = attributeDict["time"],
            let duration = attributeDict["duration"],
            let presenter = attributeDict["presenter"]
        else {
            assertionFailure("Cannot parse Station Info data")
            return nil
        }
        
        return StationInfo(
            name: name,
            description: description,
            time: time,
            duration: duration,
            presenter: presenter,
            imageURL: nil,
            displayTime: nil
        )
    }
}
