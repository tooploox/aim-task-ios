//
//  GetOnAirInfoUseCase.m
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "GetOnAirInfoUseCase.h"

@implementation GetOnAirInfoUseCase

- (instancetype) initWithGateway:(NSString *)gateway; {// change type
    self = [super init];
    if (self != nil) {
        self.gateway = gateway;
    }
    return self;
}
@end
