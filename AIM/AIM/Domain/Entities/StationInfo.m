//
//  StationInfo.m
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "StationInfo.h"

@implementation StationInfo

@synthesize description;

-(instancetype)initWithName:(NSString *)name description:(NSString *)description time:(NSString *)time duration:(NSString *)duration presenter:(NSString *)presenter displayTime:(NSString *)displayTime imageURL:(NSURL *)imageURL {
    self = [super init];
    if (self != nil) {
        self.name = name;
        self.description = description;
        self.time = time;
        self.duration = duration;
        self.presenter = presenter;
        self.displayTime = displayTime;
        self.imageURL = imageURL;
    }
    return self;
}

-(instancetype)initWithAttributesDictionary:(NSDictionary<NSString *,NSString *> *)attributes {
    if (attributes[@"name"] == nil) {
        return nil;
    }
    
    if (attributes[@"description"] == nil) {
        return nil;
    }
    
    if (attributes[@"time"] == nil) {
        return nil;
    }
    
    if (attributes[@"duration"] == nil) {
        return nil;
    }
    
    if (attributes[@"presenter"] == nil) {
        return nil;
    }
    
    self = [super init];
    if (self != nil) {
        self.name = attributes[@"name"];
        self.description = attributes[@"description"];
        self.time = attributes[@"time"];
        self.duration = attributes[@"duration"];
        self.presenter = attributes[@"presenter"];
    }
    return self;
}

@end
