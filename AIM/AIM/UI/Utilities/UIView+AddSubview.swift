//
//  UIView+AddSubview.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubview(_ subview: UIView, with constraints: [NSLayoutConstraint]) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}
