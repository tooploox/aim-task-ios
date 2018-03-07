//
//  GetOnAirInfoUseCase.h
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OnAirInfoGateway.h"

@interface GetOnAirInfoUseCase: NSObject

@property (nonatomic, weak) OnAirInfoCompletion completion;

@property (nonatomic, strong) id<OnAirInfoGateway> gateway;

- (id) initWithGateway:(id<OnAirInfoGateway>)gateway completion:(OnAirInfoCompletion)completion;
- (void) execute;

@end
