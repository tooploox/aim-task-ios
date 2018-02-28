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
        
        showEmptyView()
    }
    
    private func showEmptyView() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.red
        
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
