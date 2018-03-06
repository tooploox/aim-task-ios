//
//  UseCaseFactory.m
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "UseCaseFactory.h"
#import "OnAirInfoGateway.h"

@implementation UseCaseFactory

- (instancetype) initWithOnAirInfoGateway:(id<UseCaseProducing>)onAirInfoGateway; {
    self = [super init];
    if (self != nil) {
        self.onAirInfoGateway = onAirInfoGateway;
    }
    return self;
}

- (GetOnAirInfoUseCase *)getOnAirInfoUseCase; { // include completion as an argument
    return [[GetOnAirInfoUseCase init] initWithGateway: self.onAirInfoGateway];
}
@end

