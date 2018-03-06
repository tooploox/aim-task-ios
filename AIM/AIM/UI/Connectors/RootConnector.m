//
//  RootConnector.m
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "RootConnector.h"
#import "TrackListConnector.h"
#import <UIKit/UIKit.h>

@interface RootConnector () {
    
    UIWindow *window;
    TrackListConnector *connector;
    UIViewController *viewController;
    
}

@end

@implementation RootConnector

- (instancetype)initIn:(UIWindow *)window; {
    self = [super init];
    if (self != nil) {
        window = window;
    }
    return self;
}

- (void)showTrackListView {
//    connector = [TrackListConnector initWithUseCaseFactory: gateway]
    viewController = [connector trackListViewController];
}

- (void)changeWindowRootViewControllerWithAnimation {
    [UIView transitionWithView:window duration:0.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        window.rootViewController = viewController;
    } completion:nil];
}

@end
