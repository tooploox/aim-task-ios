//
//  OnAirInfoGateway.h
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

@protocol OnAirInfoGateway

@required
- (void)fetchOnAirInfo; // add completion as parameter

@end
