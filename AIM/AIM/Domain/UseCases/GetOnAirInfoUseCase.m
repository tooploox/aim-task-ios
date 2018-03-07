//
//  GetOnAirInfoUseCase.m
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "GetOnAirInfoUseCase.h"

@implementation GetOnAirInfoUseCase

- (id) initWithGateway:(id<OnAirInfoGateway>)gateway completion:(OnAirInfoCompletion)completion {
    self = [super init];
    if (self != nil) {
        self.gateway = gateway;
        self.completion = completion;
    }
    return self;
}

- (void) execute {
    [self.gateway fetchOnAirInfo:self.completion];
}

@end
