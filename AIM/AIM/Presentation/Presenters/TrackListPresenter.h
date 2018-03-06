//
//  TrackListPresenter.h
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TrackCell.h"
#import "StationInfoView.h"
#import "TrackListView.h"

@interface TrackListPresenter : NSObject {}

@property (nonatomic, weak) id<TrackListView> trackListView;

- (int) numberOfTracks;
- (void) configureCell: (TrackCell *) cell atIndex: (int) index;
- (void) configureHeaderView: (StationInfoView *) headerView;
- (Boolean) shouldDisplayHeader;
- (void) fetchOnAirInfo;

@end

