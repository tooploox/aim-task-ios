//
//  RootConnector.m
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "RootConnector.h"
#import "XMLOnAirInfoGateway.h"

@implementation RootConnector

- (instancetype)initInWindow:(UIWindow *)window; {
    self = [super init];
    if (self != nil) {
        self.window = window;
    }
    
    [self showTrackListView];
    
    return self;
}

- (void)showTrackListView {
    self.connector = [[TrackListConnector new] initWithUseCaseFactory: [[UseCaseFactory new] initWithOnAirInfoGateway: [[XMLOnAirInfoGateway new] init]]];
                                                                   
    self.viewController = [self.connector trackListViewController];
    [self changeWindowRootViewControllerWithAnimation:self.viewController];
}

- (void)changeWindowRootViewControllerWithAnimation: (UIViewController *)viewController {
    [UIView transitionWithView:self.window duration:0.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self.window addSubview:viewController.view];
        [self.window setRootViewController:viewController];
    } completion:nil];
}

@end
