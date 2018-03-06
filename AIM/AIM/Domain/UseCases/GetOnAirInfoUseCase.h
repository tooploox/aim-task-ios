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

@property (nonatomic, strong) id<OnAirInfoGateway> gateway;

- (instancetype) initWithGateway:(id<OnAirInfoGateway>)gateway;

@end
