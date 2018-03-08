//
//  OnAirInfo.h
//  AIM
//
//  Created by Oskar Szydlowski on 03.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StationInfo.h"

@interface OnAirInfo : NSObject

-(instancetype)initWithStationInfo:(StationInfo *)stationInfo tracks:(NSMutableArray *)tracks;

@property (nonatomic, strong) StationInfo *stationInfo;
@property (nonatomic, strong) NSArray *tracks;

@end
