//
//  RootConnector.m
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "RootConnector.h"
#import "TrackListConnector.h"
#import "XMLOnAirInfoGateway.h"

@interface RootConnector () {
    
    UIWindow *window;
    TrackListConnector *connector;
    UIViewController *viewController;
    
}

@end

@implementation RootConnector

- (instancetype)initInWindow:(UIWindow *)window; {
    self = [super init];
    if (self != nil) {
        self->window = window;
    }
    
    [self showTrackListView];
    
    return self;
}

- (void)showTrackListView {
    connector = [[TrackListConnector new] initWithUseCaseFactory: [[UseCaseFactory new] initWithOnAirInfoGateway: [[XMLOnAirInfoGateway new] init]]];
                                                                   
    viewController = [connector trackListViewController];
    [self changeWindowRootViewControllerWithAnimation:viewController];
}

- (void)changeWindowRootViewControllerWithAnimation: (UIViewController *)viewController {
    [UIView transitionWithView:window duration:0.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self->window addSubview:viewController.view];
        [self->window setRootViewController:viewController];
    } completion:nil];
}

@end
