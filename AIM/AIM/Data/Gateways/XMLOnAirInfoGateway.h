//
//  XMLOnAirInfoGateway.h
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "OnAirInfoGateway.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XMLOnAirInfoGateway : NSObject <NSXMLParserDelegate, OnAirInfoGateway> {}
@end
