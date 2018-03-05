//
//  StationInfoView.h
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StationInfoView : UIView {}

- (void) displayImage: (NSURL *) URL;
- (void) displayName: (NSString *) name;
- (void) displayDescription: (NSString *) description;

@end
