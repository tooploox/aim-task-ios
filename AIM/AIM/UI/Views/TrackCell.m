//
//  TrackCell.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "TrackCell.h"
#import <UIKit/UIKit.h>

@interface TrackCell () {
    
    UILabel *titleLabel;
    UILabel *artistLabel;
    UIImageView *coverImageView;
    UILabel *durationLabel;
//    ImageTask *coverImageTask; 
    
}

@end

@implementation TrackCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setupView];
    return self;
}

-(void)prepareForReuse {
    [super prepareForReuse];
    //cancel cover image task         coverImageTask?.cancel()
    coverImageView = nil;
    titleLabel.text = nil;
    artistLabel.text = nil;
    durationLabel.text = nil;
}

-(void)setupView {
//    [self setupCoverImageView];
//    [self setupTitleLabel];
//    [self setupArtistLabel];
//    [self setupDurationLabel];
}

-(void)setupCoverImageView {
    coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:coverImageView];
    [self addConstraints:@[
                                             [coverImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5.0],
                                             [coverImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:5.0],
                                             [coverImageView.heightAnchor constraintEqualToConstant:80.0],
                                             [coverImageView.widthAnchor constraintEqualToConstant:80.0]
    ]];
}

-(void)setupTitleLabel {
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:titleLabel];
    [self addConstraints:@[
                           [titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5.0],
                           [titleLabel.leadingAnchor constraintEqualToAnchor:coverImageView.trailingAnchor constant:10.0],
                           [titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-5.0]
    ]];
}

-(void)setupArtistLabel {
    artistLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:artistLabel];
    [self addConstraints:@[
                           [artistLabel.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor constant:5.0],
                           [artistLabel.leadingAnchor constraintEqualToAnchor:titleLabel.leadingAnchor],
                           [artistLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -5.0]
    ]];
}

-(void)setupDurationLabel {
    durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:durationLabel];
    [self addConstraints:@[
                           [durationLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-5.0],
                           [durationLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-5.0]
    ]];
}

- (void) displayImage: (NSURL *) URL {
    // set image         coverImageTask = coverImageView.setImage(with: URL)
}

- (void) displayTitle: (NSString *) title {
    titleLabel.text = title;
}

- (void) displayArtist: (NSString *) artist {
    artistLabel.text = artist;
}

- (void) displayDuration: (NSString *) duration {
    durationLabel.text = duration;
}

@end
