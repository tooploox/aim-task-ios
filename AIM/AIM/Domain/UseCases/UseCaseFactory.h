//
//  UseCaseFactory.h
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetOnAirInfoUseCase.h"

@protocol UseCaseProducing

- (GetOnAirInfoUseCases *)getOnAirInfoUseCase; // include completion as an argument

@end

@interface UseCaseFactorys: NSObject <UseCaseProducing>

@property (nonatomic, strong) NSString *onAirInfoGateway; // change to XMLOnAirInfoGateway

- (instancetype) initWithOnAirInfoGateway:(NSString *)onAirInfoGateway; // change to XMLOnAirInfoGateway

@end
