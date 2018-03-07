//
//  UseCaseFactory.h
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OnAirInfoGateway.h"
#import "GetOnAirInfoUseCase.h"

@protocol UseCaseProducing

@required
- (GetOnAirInfoUseCase *)getOnAirInfoUseCase:(OnAirInfoCompletion)completion;

@end

@interface UseCaseFactory: NSObject <UseCaseProducing>

@property (nonatomic, strong) id<OnAirInfoGateway> onAirInfoGateway;

- (instancetype) initWithOnAirInfoGateway:(id<OnAirInfoGateway>)onAirInfoGateway;
- (GetOnAirInfoUseCase *)getOnAirInfoUseCase:(OnAirInfoCompletion)completion;

@end
