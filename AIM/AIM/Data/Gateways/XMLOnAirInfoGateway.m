//
//  XMLOnAirInfoGateway.m
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "XMLOnAirInfoGateway.h"

@implementation XMLOnAirInfoGateway

- (id)init {
    self = [super init];
    if (self != nil) {
        self.parser = [[NSXMLParser new] initWithContentsOfURL: [[NSURL alloc] initWithString: @"http://aim.appdata.abc.net.au.edgesuite.net/data/abc/triplej/onair.xml"]];
        self.parser.delegate = self;
        self.tracks = [[NSMutableArray alloc] init];
        self.stationDisplayTime = [NSString new];
    };
    return self;
}

- (void)fetchOnAirInfo:(OnAirInfoCompletion)completion {
    self.onAirInfoCompletion = completion;
    [self.parser parse];
}


// MARK: - XMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName  isEqual: @"epgItem"]) {
        self.stationInfo = [[StationInfo new] initWithAttributesDictionary:attributeDict];
    } else if ([elementName  isEqual: @"customField"]) {
        if (attributeDict[@"name"] != nil) {
            if ([attributeDict[@"name"]  isEqual: @"displayTime"]) {
                self.stationDisplayTime = attributeDict[@"value"];
            } else if ([attributeDict[@"name"]  isEqual: @"image320"]) {
                self.stationImageURL = [[NSURL alloc] initWithString:attributeDict[@"value"]];
            }
        }
    } else if ([elementName  isEqual: @"playoutItem"]) {
        self.track = [[Track new] initWithAttributesDictionary:attributeDict];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName; {
    if ([elementName  isEqual: @"playoutItem"]) {
        if (self.track != nil) {
            [self.tracks addObject:self.track];
        }
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser; {
    if (self.stationInfo == nil || self.stationDisplayTime == nil || self.stationImageURL == nil) {
        self.onAirInfo = [[OnAirInfo new] initWithStationInfo:self.stationInfo tracks:self.tracks];
        self.onAirInfoCompletion(self.onAirInfo);
        return;

    }
    self.stationInfo = [[StationInfo new] initWithName:self.stationInfo.name description:self.stationInfo.description time:self.stationInfo.time duration: self.stationInfo.duration presenter:self.stationInfo.presenter displayTime:self.stationDisplayTime imageURL:self.stationImageURL];
    self.onAirInfo = [[OnAirInfo new] initWithStationInfo:self.stationInfo tracks: self.tracks];
    self.onAirInfoCompletion(self.onAirInfo);
}

@end
