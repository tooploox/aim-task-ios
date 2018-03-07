//
//  UseCaseFactory.m
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "UseCaseFactory.h"

@implementation UseCaseFactory

- (id) initWithOnAirInfoGateway:(id<OnAirInfoGateway>)onAirInfoGateway {
    self = [super init];
    if (self != nil) {
        self.onAirInfoGateway = onAirInfoGateway;
    }
    return self;
}

- (GetOnAirInfoUseCase *)getOnAirInfoUseCase:(OnAirInfoCompletion)completion {
    return [[GetOnAirInfoUseCase new] initWithGateway:self.onAirInfoGateway completion:completion];
}

@end

