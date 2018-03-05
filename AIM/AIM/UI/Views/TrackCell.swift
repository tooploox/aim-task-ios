//
//  TrackCell.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.brown
        return label
    }()
    private let artistLabel = UILabel()
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    }()
    private let durationLabel = UILabel()
    
    private var coverImageTask: ImageTask?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageTask?.cancel()
        coverImageView.image = nil
        titleLabel.text = ""
        artistLabel.text = ""
        durationLabel.text = ""
    }
    
    private func setupView() {
        setupCoverImageView()
        setupTitleLabel()
        setupArtistLabel()
        setupDurationLabel()
    }
    
    private func setupCoverImageView() {
        contentView.addSubview(coverImageView, with: [
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0),
            coverImageView.heightAnchor.constraint(equalToConstant: 80.0),
            coverImageView.widthAnchor.constraint(equalToConstant: 80.0)
        ])
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel, with: [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            titleLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0)
        ])
    }
    
    private func setupArtistLabel() {
        contentView.addSubview(artistLabel, with: [
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5.0),
            artistLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            artistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0)
        ])
    }
    
    private func setupDurationLabel() {
        contentView.addSubview(durationLabel, with: [
            durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0),
            durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0)
        ])
    }
    
    func displayImage(_ URL: URL) {
        coverImageTask = coverImageView.setImage(with: URL)
    }
    
    func displayTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func displayArtist(_ artist: String) {
        artistLabel.text = artist
    }
    
    func displayDuration(_ duration: String) {
        durationLabel.text = duration
    }
}
