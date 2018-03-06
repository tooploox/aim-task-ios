//
//  TrackListConnector.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "TrackListConnector.h"
#import "TrackListPresenter.h"
#import "TrackListViewController.h"
#import <UIKit/UIKit.h>

@interface TrackListConnector () {
    
    id<UseCaseProducing> useCaseFactory;
    TrackListPresenter *presenter;
    TrackListViewController *viewController;
    
}

@end

@implementation TrackListConnector

- (id)initWithUseCaseFactory:(id<UseCaseProducing>)useCaseFactory {
    self = [super init];
    if (self != nil) {
        useCaseFactory = useCaseFactory;
    }
    return self;
}

- (UIViewController *)trackListViewController {
    presenter = [[TrackListPresenter new] initWithConnector:self useCaseFactory:useCaseFactory];
    viewController = [[TrackListViewController new] initWithPresenter:presenter];
    presenter.view = viewController;
    
    return viewController;
}

@end
