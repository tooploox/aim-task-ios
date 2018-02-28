//
//  TrackListConnector.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit

class TrackListConnector {
    
    func trackListViewController() -> UIViewController {
        let presenter = TrackListPresenter(connector: self, useCaseFactory: UseCaseFactory())
        let viewController = TrackListViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
}
