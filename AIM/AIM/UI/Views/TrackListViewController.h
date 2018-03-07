//
//  TrackListViewController.h
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TrackListView.h"
#import "TrackListPresenter.h"

@interface TrackListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, TrackListView> {}

@property TrackListPresenter *presenter;

- (id)initWithPresenter:(TrackListPresenter *)presenter;
- (void) refreshView;

@end
