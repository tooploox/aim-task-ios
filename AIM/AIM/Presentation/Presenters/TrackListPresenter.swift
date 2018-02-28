//
//  TrackListPresenter.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

class TrackListPresenter {
    
    weak var view: TrackListView?
    
    private let connector: TrackListConnector
    private let useCaseFactory: UseCaseProducing
    
    private var onAirInfo: OnAirInfo?
    
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
        let track = onAirInfo?.tracks[index]
    }
}
