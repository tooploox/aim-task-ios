//
//  StationInfoView.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit
import Kingfisher

class StationInfoView: UIView {
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupImageView()
        setupNameLabel()
        setupDescriptionLabel()
    }
    
    private func setupImageView() {
        addSubview(imageView, with: [
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5.0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.0),
            imageView.heightAnchor.constraint(equalToConstant: 80.0),
            imageView.widthAnchor.constraint(equalToConstant: 80.0)
        ])
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel, with: [
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5.0),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10.0)
        ])
    }
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel, with: [
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0)
        ])
        
        descriptionLabel.numberOfLines = 0
    }
    
    func displayImage(_ URL: URL) {
        imageView.kf.setImage(with: URL)
    }
    
    func displayName(_ name: String) {
        nameLabel.text = name
    }
    
    func displayDescription(_ description: String) {
        descriptionLabel.text = description
    }
}
