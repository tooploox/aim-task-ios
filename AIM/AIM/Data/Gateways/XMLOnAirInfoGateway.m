//
//  XMLOnAirInfoGateway.m
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "XMLOnAirInfoGateway.h"
#import <UIKit/UIKit.h>

@interface XMLOnAirInfoGateway () {
    
    NSURL *onAirInfoFeedURL;
    NSXMLParser *parser;
    NSString *stationDisplayTime;
    NSURL *stationImageURL;
//    StationInfo *stationInfo;
    //    private var tracks = [Track]()
//    Track *track;
    //    private var parserCompletion: OnAirInfoCompletion?

//
//    private enum XMLKeys: String {
//    case stationInfo = "epgItem"
//    case customField = "customField"
//    case displayTime = "displayTime"
//    case image = "image320"
//    case name = "name"
//    case value = "value"
//    case track = "playoutItem"
//    }
//

    
}

@end

@implementation XMLOnAirInfoGateway

- (id)init {
    self = [super init];
    if (self != nil) {
        parser = [[NSXMLParser new] initWithContentsOfURL: onAirInfoFeedURL];
        parser.delegate = self;
    };
    return self;
}

- (void)fetchOnAirInfo { //add completion
    //    parserCompletion = completion
    [parser parse];
}

// MARK: - XMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if (elementName == @"epgItem") {
        //        stationInfo = StationInfo.fromAttributeDict(attributeDict: attributeDict)
    } else if (elementName == @"customField") {
        if (attributeDict[@"name"] != nil) {
            if (attributeDict[@"name"] == @"displayTime") {
                //                stationDisplayTime = attributeDict[XMLKeys.value.rawValue]
            } else if (attributeDict[@"name"] == @"image320") {
//                if let imageURLString = attributeDict[XMLKeys.value.rawValue], let imageURL = URL(string: imageURLString) {
                    //                    stationImageURL = imageURL
                    //                }
            }
        }
    } else if (elementName == @"playoutItem") {
        //        track = Track.fromAttributeDict(attributeDict: attributeDict)

    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName; {
    //    if elementName == XMLKeys.track.rawValue, let track = track {
    //        tracks.append(track)
    //    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser; {
    if (stationDisplayTime == nil || stationImageURL == nil) { //check if stationInfo is nil
        //        let onAirInfo = OnAirInfo(stationInfo: nil, tracks: tracks)
        //        parserCompletion?(onAirInfo)
        //        return
    }
    //    let onAirInfo = OnAirInfo(
    //                              stationInfo:
    //                              StationInfo(
    //                                          name: stationInfo.name,
    //                                          description: stationInfo.description,
    //                                          time: stationInfo.time,
    //                                          duration: stationInfo.duration,
    //                                          presenter: stationInfo.presenter,
    //                                          displayTime: stationDisplayTime,
    //                                          imageURL: stationImageURL
    //                                          ),
    //                              tracks: tracks
    //                              )
    //    parserCompletion?(onAirInfo)
    
}

@end
