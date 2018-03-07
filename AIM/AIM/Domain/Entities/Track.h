//
//  Track.h
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject

-(id)initWithAttributesDictionary:(NSDictionary<NSString *,NSString *> *)attributes;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *album;
@property (nonatomic, strong) NSString *playTime;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *type;

@end
