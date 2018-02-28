//
//  RootConnector.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit

class RootConnector {
    
    private let window: UIWindow
    
    init(in window: UIWindow) {
        self.window = window
        
        showTrackListView()
    }
    
    private func showTrackListView() {
        let connector = TrackListConnector()
        let viewController = connector.trackListViewController()
        
        changeWindowRootViewControllerWithAnimation(
            viewController: viewController
        )
    }
    
    private func changeWindowRootViewControllerWithAnimation(viewController: UIViewController) {
        UIView.transition(with: window, duration: 0.4, options: .transitionFlipFromLeft, animations: {
            self.window.rootViewController = viewController
        }, completion: nil)
    }
}
