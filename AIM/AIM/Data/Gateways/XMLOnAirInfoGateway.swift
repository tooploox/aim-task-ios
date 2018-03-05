//
//  XMLOnAirInfoGateway.swift
//  AIM
//
//  Created by Oskar Szydlowski on 01.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import Foundation

typealias OnAirInfoCompletion = (OnAirInfo) -> ()

class XMLOnAirInfoGateway: NSObject, XMLParserDelegate {
    
    private let onAirInfoFeedURL = URL(string: "http://aim.appdata.abc.net.au.edgesuite.net/data/abc/triplej/onair.xml")!
    private var parser: XMLParser
    
    private enum XMLKeys: String {
        case stationInfo = "epgItem"
        case customField = "customField"
        case displayTime = "displayTime"
        case image = "image320"
        case name = "name"
        case value = "value"
        case track = "playoutItem"
    }
    
    private var stationDisplayTime: String?
    private var stationImageURL: URL?
    private var stationInfo: StationInfo?
    private var tracks = [Track]()
    private var track: Track?
    
    private var parserCompletion: OnAirInfoCompletion?
    
    override init() {
        self.parser = XMLParser(contentsOf: onAirInfoFeedURL)!
        super.init()
        parser.delegate = self
    }
    
    func parse(completion: @escaping OnAirInfoCompletion) {
        parserCompletion = completion
        parser.parse()
    }
    
    // MARK: - XMLParserDelegate
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == XMLKeys.stationInfo.rawValue {
            stationInfo = StationInfo.fromAttributeDict(attributeDict: attributeDict)
        } else if elementName == XMLKeys.customField.rawValue {
            if let attributeName = attributeDict[XMLKeys.name.rawValue] {
                if attributeName == XMLKeys.displayTime.rawValue {
                    stationDisplayTime = attributeDict[XMLKeys.value.rawValue]
                } else if attributeName == XMLKeys.image.rawValue {
                    if let imageURLString = attributeDict[XMLKeys.value.rawValue], let imageURL = URL(string: imageURLString) {
                        stationImageURL = imageURL
                    }
                }
            }
        } else if elementName == XMLKeys.track.rawValue {
            track = Track.fromAttributeDict(attributeDict: attributeDict)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == XMLKeys.track.rawValue, let track = track {
            tracks.append(track)
        }
    }

    func parserDidEndDocument(_ parser: XMLParser) {
        guard
            let stationInfo = stationInfo,
            let stationDisplayTime = stationDisplayTime,
            let stationImageURL = stationImageURL
        else {
            let onAirInfo = OnAirInfo(stationInfo: nil, tracks: tracks)
            parserCompletion?(onAirInfo)
            return
        }
                
        let onAirInfo = OnAirInfo(
            stationInfo:
                StationInfo(
                    name: stationInfo.name,
                    description: stationInfo.description,
                    time: stationInfo.time,
                    duration: stationInfo.duration,
                    presenter: stationInfo.presenter,
                    displayTime: stationDisplayTime,
                    imageURL: stationImageURL
                ),
            tracks: tracks
        )
        parserCompletion?(onAirInfo)
    }
}
