//
//  StationInfo.h
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StationInfo : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *presenter;
@property (nonatomic, strong) NSString *displayTime;
@property (nonatomic, strong) NSURL *imageURL;

-(id)initWithName:(NSString *)name description:(NSString *)description time:(NSString *)time duration:(NSString *)duration presenter:(NSString *)presenter displayTime:(NSString *)displayTime imageURL:(NSURL *)imageURL;
-(id)initWithAttributesDictionary:(NSDictionary<NSString *,NSString *> *)attributes;

@end
