//
//  RootConnector.h
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TrackListConnector.h"

@interface RootConnector : NSObject {}

@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, strong) TrackListConnector *connector;
@property(nonatomic, strong) UIViewController *viewController;

- (instancetype)initInWindow:(UIWindow *)window;

@end
