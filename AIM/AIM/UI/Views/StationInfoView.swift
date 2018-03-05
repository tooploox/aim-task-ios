//
//  StationInfoView.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit

class StationInfoView: UIView {
    
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let imageView = UIImageView()
    private let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor.gray
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.white
        setupSeparator()
        setupImageView()
        setupNameLabel()
        setupDescriptionLabel()
    }
    
    private func setupSeparator() {
        addSubview(separator, with: [
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 5.0)
        ])
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
            descriptionLabel.bottomAnchor.constraint(equalTo: separator.topAnchor)
        ])
        
        descriptionLabel.numberOfLines = 0
    }
    
    func displayImage(_ URL: URL) {
        imageView.setImage(with: URL)
    }
    
    func displayName(_ name: String) {
        nameLabel.text = name
    }
    
    func displayDescription(_ description: String) {
        descriptionLabel.text = description
    }
}
