//
//  UseCaseFactory.m
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "UseCaseFactory.h"

@implementation UseCaseFactorys

- (instancetype) initWithOnAirInfoGateway:(NSString *)onAirInfoGateway; { // change to XMLOnAirInfoGateway
    self = [super init];
    if (self != nil) {
        self.onAirInfoGateway = onAirInfoGateway;
    }
    return self;
}

- (GetOnAirInfoUseCases *)getOnAirInfoUseCase; { // include completion as an argument
    return [[GetOnAirInfoUseCases init] initWithGateway: self.onAirInfoGateway];
}
@end

