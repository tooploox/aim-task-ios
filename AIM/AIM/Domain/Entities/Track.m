//
//  Track.m
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "Track.h"

@implementation Track

-(instancetype)initWithAttributesDictionary:(NSDictionary<NSString *,NSString *> *)attributes {
    if (attributes[@"title"] == nil) {
        return nil;
    }
    
    if (attributes[@"artist"] == nil) {
        return nil;
    }
    
    if (attributes[@"album"] == nil) {
        return nil;
    }
    
    if (attributes[@"time"] == nil) {
        return nil;
    }
    
    if (attributes[@"duration"] == nil) {
        return nil;
    }
    
    if (attributes[@"imageUrl"] == nil) {
        return nil;
    }
    
    if (attributes[@"status"] == nil) {
        return nil;
    }
    
    if (attributes[@"type"] == nil) {
        return nil;
    }
    
    self = [super init];
    if (self != nil) {
        self.title = attributes[@"title"];
        self.artist = attributes[@"artist"];
        self.album = attributes[@"album"];
        self.playTime = attributes[@"playTime"];
        self.duration = attributes[@"duration"];
        self.imageURL = [[NSURL alloc] initWithString:attributes[@"imageUrl"]];
        self.status = attributes[@"status"];
        self.type = attributes[@"type"];
    }
    return self;
}

@end
