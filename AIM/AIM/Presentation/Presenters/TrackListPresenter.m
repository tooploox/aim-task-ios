//
//  TrackListPresenter.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TrackListPresenter.h"
#import "StationInfo.h"
#import "Track.h"

@implementation TrackListPresenter

- (instancetype)initWithConnector:(TrackListConnector *)connector useCaseFactory:(id<UseCaseProducing>)useCaseFactory {
    self = [super init];
    if (self != nil) {
        self.connector = connector;
        self.useCaseFactory = useCaseFactory;
    }
    
    return self;
}

- (int) numberOfTracks {
    if (self.onAirInfo == nil) {
        return 0;
    }
    
    return (int)self.onAirInfo.tracks.count;
}

- (void) configureCell: (TrackCell *) cell atIndex: (int) index; {
    if (self.onAirInfo == nil) {
        return;
    }
    
    Track *track = [self.onAirInfo.tracks objectAtIndex:index];
    
    if (track.imageURL != nil) {
        [cell displayImage: track.imageURL];
    }
    
    [cell displayTitle: track.title];
    [cell displayArtist: track.artist];
    [cell displayDuration: track.duration];
}

- (void) configureHeaderView: (StationInfoView *) headerView {
    if (self.onAirInfo == nil || self.onAirInfo.stationInfo == nil) {
        return;
    }
    if (self.onAirInfo.stationInfo.imageURL != nil) {
        [headerView displayImage:self.onAirInfo.stationInfo.imageURL];
    }

    [headerView displayName:self.onAirInfo.stationInfo.name];
    [headerView displayDescription:self.onAirInfo.stationInfo.description];
}

- (Boolean) shouldDisplayHeader {
    return self.onAirInfo.stationInfo != nil;
}

- (void) fetchOnAirInfo {
    [[self.useCaseFactory getOnAirInfoUseCase:^(OnAirInfo *onAirInfo) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.onAirInfo = onAirInfo;
            [self.view refreshView];
        });
    }] execute];
}

@end
