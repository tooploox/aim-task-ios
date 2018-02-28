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
    
    init(connector: TrackListConnector, useCaseFactory: UseCaseProducing) {
        self.connector = connector
        self.useCaseFactory = useCaseFactory
    }
}
