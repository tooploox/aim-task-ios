//
//  UIImageView+Kingfisher.swift
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit
import Kingfisher

protocol ImageTask {
    func cancel()
}

extension RetrieveImageTask: ImageTask { }

extension UIImageView {
    
    @discardableResult func setImage(with url: URL?) -> ImageTask {
        return kf.setImage(with: url)
    }
}
