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
#import "TrackListConnector.h"
#import "StationInfoView.h"
#import "TrackListView.h"
#import "OnAirInfo.h"
#import "useCaseFactory.h"

@interface TrackListPresenter : NSObject {}

@property (nonatomic, weak) id<TrackListView> view;

@property (nonatomic, strong) TrackListConnector *connector;
@property (nonatomic, strong) id<UseCaseProducing> useCaseFactory;
@property (nonatomic, strong) OnAirInfo *onAirInfo;

- (instancetype)initWithConnector:(TrackListConnector *)connector useCaseFactory:(id<UseCaseProducing>)useCaseFactory;
- (int) numberOfTracks;
- (void) configureCell: (TrackCell *) cell atIndex: (int) index;
- (void) configureHeaderView: (StationInfoView *) headerView;
- (Boolean) shouldDisplayHeader;
- (void) fetchOnAirInfo;

@end

