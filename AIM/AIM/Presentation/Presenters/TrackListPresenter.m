//
//  TrackListPresenter.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackListPresenter.h"
#import "TrackListConnector.h"
#import "UseCaseFactory.h"
#import "OnAirInfo.h"
#import "Track.h"

@interface TrackListPresenter () {
    
    TrackListConnector *connector;
    id<UseCaseProducing> useCaseFactory;
    
    OnAirInfo *onAirInfo;
    
}

@end

@implementation TrackListPresenter

- (instancetype)initWithConnector:(TrackListConnector *)connector useCaseFactory:(id<UseCaseProducing>)useCaseFactory {
    self = [super init];
    if (self != nil) {
        self->connector = connector;
        self->useCaseFactory = useCaseFactory;
    }
    
    return self;
}

- (int) numberOfTracks {
    if (onAirInfo == nil) {
        return 0;
    }
    
    return onAirInfo.tracks.count;
}

- (void) configureCell: (TrackCell *) cell atIndex: (int) index; {
    if (onAirInfo == nil) {
        return;
    }
    
    Track *track = [onAirInfo.tracks objectAtIndex:index];
    
    if (track.imageURL != nil) {
        [cell displayImage: track.imageURL];
    }
    
    [cell displayTitle: track.title];
    [cell displayArtist: track.artist];
    [cell displayDuration: track.duration];
}

- (void) configureHeaderView: (StationInfoView *) headerView {
    if (onAirInfo == nil ||onAirInfo.stationInfo == nil) {
        return;
    }

    if (onAirInfo.stationInfo.imageURL != nil) {
        [headerView displayImage:onAirInfo.stationInfo.imageURL];
    }

    [headerView displayName:onAirInfo.stationInfo.name];
    [headerView displayDescription:onAirInfo.stationInfo.description];
}

- (Boolean) shouldDisplayHeader {
    return onAirInfo.stationInfo != nil;

}

- (void) fetchOnAirInfo {
//    useCaseFactory.getOnAirInfoUseCase { [weak self] onAirInfo in
//        DispatchQueue.main.async {
//            self?.onAirInfo = onAirInfo
//            self?.view?.refreshView()
//        }
//    }.execute()
}

@end
