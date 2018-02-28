//
//  TrackListPresenter.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import Foundation

class TrackListPresenter {
    
    weak var view: TrackListView?
    
    private let connector: TrackListConnector
    private let useCaseFactory: UseCaseProducing
    
    private var onAirInfo: OnAirInfo? = OnAirInfo(stationInfo: StationInfo(name: "Mid Dawns", description: "Stay up late with our mid dawn team as they play you new music all night long.", time: "2018-03-01T01:00:00+11:00", duration: "05:00:00", presenter: "", imageURL: URL(string: "http://www.abc.net.au/triplej/programs/img/2017/middawns/background320.jpg")!, displayTime: "Mon-Sat 1-6am"), tracks: [Track(title: "Chasing Stars {Ft. Bertie Blackman}", artist: "Alice Ivy", album: "I'm Dreaming", playTime: "2018-03-01T03:19:06+11:00", duration: "00:03:39", imageURL: URL(string: "http://www.abc.net.au/triplej/albums/56545/covers/190.jpg")!, status: .playing, type: .song)])
    
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
