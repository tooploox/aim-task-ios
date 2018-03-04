//
//  GetOnAirInfoUseCase.h
//  AIM
//
//  Created by Oskar Szydlowski on 04.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetOnAirInfoUseCases: NSObject

@property (nonatomic, strong) NSString *gateway; // change to XMLOnAirInfoGateway

- (instancetype) initWithGateway:(NSString *)gateway; // change to XMLOnAirInfoGateway

@end
