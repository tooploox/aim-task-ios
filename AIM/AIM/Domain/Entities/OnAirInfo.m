//
//  OnAirInfo.m
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "OnAirInfo.h"

@implementation OnAirInfo

-(instancetype)initWithStationInfo:(StationInfo *)stationInfo tracks:(NSMutableArray *)tracks {
    self = [super init];
    if (self != nil) {
        self.stationInfo = stationInfo;
        self.tracks = tracks;
    }
    return self;
}

@end
