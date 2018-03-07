//
//  XMLOnAirInfoGateway.h
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "OnAirInfoGateway.h"
#import "OnAirInfo.h"
#import "StationInfo.h"
#import "Track.h"

@interface XMLOnAirInfoGateway : NSObject <NSXMLParserDelegate, OnAirInfoGateway> {}

@property (nonatomic, weak) OnAirInfoCompletion onAirInfoCompletion;

@property (nonatomic, strong) NSString *stationDisplayTime;
@property (nonatomic, strong) NSURL *stationImageURL;
@property (nonatomic, strong) StationInfo *stationInfo;
@property (nonatomic, strong) NSMutableArray *tracks;
@property (nonatomic, strong) Track *track;
@property (nonatomic, strong) OnAirInfo *onAirInfo;

@property (nonatomic, strong) NSXMLParser *parser;

@end
