//
//  TrackListConnector.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "TrackListConnector.h"
#import <UIKit/UIKit.h>

@interface TrackListConnector () {
    
    id<UseCaseProducing> useCaseFactory; //change type to UseCaseProducing
    
}

@end

@implementation TrackListConnector

- (instancetype)initWithUseCaseFactory:(id<UseCaseProducing>)useCaseFactory { // change type here too
    self = [super init];
    if (self != nil) {
        useCaseFactory = useCaseFactory;
    }
    return self;
}

- (UIViewController *)trackListViewController {
//    let presenter = TrackListPresenter(connector: self, useCaseFactory: useCaseFactory)
//    let viewController = TrackListViewController(presenter: presenter)
//    presenter.view = viewController
    return [UIViewController new];
}

@end
