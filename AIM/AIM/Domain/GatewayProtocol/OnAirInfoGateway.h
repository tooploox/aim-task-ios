//
//  OnAirInfoGateway.h
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "OnAirInfo.h"

@protocol OnAirInfoGateway

typedef void(^OnAirInfoCompletion)(OnAirInfo *onAirInfo);

@required
- (void)fetchOnAirInfo:(OnAirInfoCompletion)completion;

@end
