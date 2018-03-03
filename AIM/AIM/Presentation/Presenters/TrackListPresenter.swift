//
//  TrackListPresenter.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit

class TrackListPresenter {
    
    weak var view: TrackListView?
    
    private let connector: TrackListConnector
    private let useCaseFactory: UseCaseProducing
    
    var onAirInfo: OnAirInfo?
    
    init(connector: TrackListConnector, useCaseFactory: UseCaseProducing) {
        self.connector = connector
        self.useCaseFactory = useCaseFactory
    }
    
    func numberOfTracks() -> Int {
        guard let onAirInfo = onAirInfo else {
            return 0
        }

        return onAirInfo.tracks.count
    }
    
    func configureCell(_ cell: TrackCell, at index: Int) {
        guard let onAirInfo = onAirInfo else {
            return
        }
        
        let track = onAirInfo.tracks[index]
        
        if let imageURL = track.imageURL {
            cell.displayImage(imageURL)
        }
        cell.displayTitle(track.title)
        cell.displayArtist(track.artist)
        cell.displayDuration(track.duration)
    }
    
    func configureHeaderView(_ headerView: StationInfoView) {
        guard
            let onAirInfo = onAirInfo,
            let stationInfo = onAirInfo.stationInfo
        else {
            return
        }
        
        if let imageURL = stationInfo.imageURL {
            headerView.displayImage(imageURL)
        }
        headerView.displayName(stationInfo.name)
        headerView.displayDescription(stationInfo.description)
    }
    
    func fetchOnAirInfo() {
        useCaseFactory.getOnAirInfoUseCase { [weak self] onAirInfo in
            DispatchQueue.main.async {
                self?.onAirInfo = onAirInfo
                self?.view?.refreshView()
            }
        }.execute()
    }
}
