//
//  TrackCell.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "TrackCell.h"

@implementation TrackCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupView];
    }
    return self;
}

-(void)prepareForReuse {
    [super prepareForReuse];
    self.coverImageView = nil;
    self.titleLabel.text = nil;
    self.artistLabel.text = nil;
    self.durationLabel.text = nil;
}

-(void)setupView {
    [self setupCoverImageView];
    [self setupTitleLabel];
    [self setupArtistLabel];
    [self setupDurationLabel];
}

-(void)setupCoverImageView {
    self.coverImageView = [UIImageView new];
    self.coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.coverImageView];
    [self addConstraints:@[
                                             [self.coverImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5.0],
                                             [self.coverImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:5.0],
                                             [self.coverImageView.heightAnchor constraintEqualToConstant:80.0],
                                             [self.coverImageView.widthAnchor constraintEqualToConstant:80.0]
    ]];
}

-(void)setupTitleLabel {
    self.titleLabel = [UILabel new];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.titleLabel];
    [self addConstraints:@[
                           [self.titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5.0],
                           [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.coverImageView.trailingAnchor constant:10.0],
                           [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-5.0]
    ]];
}

-(void)setupArtistLabel {
    self.artistLabel = [UILabel new];
    self.artistLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.artistLabel];
    [self addConstraints:@[
                           [self.artistLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:5.0],
                           [self.artistLabel.leadingAnchor constraintEqualToAnchor:self.titleLabel.leadingAnchor],
                           [self.artistLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -5.0]
    ]];
}

-(void)setupDurationLabel {
    self.durationLabel = [UILabel new];
    self.durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.durationLabel];
    [self addConstraints:@[
                           [self.durationLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-5.0],
                           [self.durationLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-5.0]
    ]];
}

- (void) displayImage: (NSURL *) URL {
    [self.coverImageView sd_setImageWithURL:URL];
}

- (void) displayTitle: (NSString *) title {
    self.titleLabel.text = title;
}

- (void) displayArtist: (NSString *) artist {
    self.artistLabel.text = artist;
}

- (void) displayDuration: (NSString *) duration {
    self.durationLabel.text = duration;
}

@end
