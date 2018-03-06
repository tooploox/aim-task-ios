//
//  UseCaseFactory.h
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetOnAirInfoUseCase.h"
#import "OnAirInfoGateway.h"

@protocol UseCaseProducing

@required
- (GetOnAirInfoUseCase *)getOnAirInfoUseCase; // include completion as an argument

@end

@interface UseCaseFactory: NSObject <UseCaseProducing>

@property (nonatomic, strong) id<OnAirInfoGateway> onAirInfoGateway;

- (instancetype) initWithOnAirInfoGateway:(id<OnAirInfoGateway>)onAirInfoGateway;

@end
