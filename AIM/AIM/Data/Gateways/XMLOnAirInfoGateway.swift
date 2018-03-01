//
//  XMLOnAirInfoGateway.swift
//  AIM
//
//  Created by Oskar Szydlowski on 01.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import Foundation

class XMLOnAirInfoGateway: NSObject, XMLParserDelegate {
    
    private let onAirInfoFeedURL = URL(string: "http://aim.appdata.abc.net.au.edgesuite.net/data/abc/triplej/onair.xml")!
    private var parser: XMLParser
    
    private var stationDisplayTime: String?
    private var stationImageURL: URL?
    private var stationInfo: StationInfo?
    private var tracks = [Track]()
    private var track: Track?
    
    override init() {
        self.parser = XMLParser(contentsOf: onAirInfoFeedURL)!
        super.init()
        parser.delegate = self
    }
    
    func parse() {
        parser.parse()
    }
    
    // MARK: - XMLParserDelegate
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "epgItem" {
            stationInfo = StationInfo.fromAttributeDict(attributeDict: attributeDict)
        } else if elementName == "customField" {
            if let displayTime = attributeDict["displayTime"] {
                stationDisplayTime = displayTime
            } else if let imageURLString = attributeDict["image320"] {
                if let imageURL = URL(string: imageURLString) {
                    stationImageURL = imageURL
                }
            }
        } else if elementName == "playoutItem" {
            track = Track.fromAttributeDict(attributeDict: attributeDict)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "playoutItem" {
            guard let track = track else { return }
        
            tracks.append(track)
        }
    }

    func parserDidEndDocument(_ parser: XMLParser) {
        guard
            let stationInfo = stationInfo,
            let stationDisplayTime = stationDisplayTime,
            let stationImageURL = stationImageURL
        else {
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
                    imageURL: stationImageURL,
                    displayTime: stationDisplayTime
                ),
            tracks: tracks
        )
        // return onAirInfo
    }
}
