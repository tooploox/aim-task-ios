//
//  StationInfoView.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "StationInfoView.h"

@implementation StationInfoView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectZero];
    [self setupView];
    return self;
}

-(void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    [self setupSeparator];
    [self setupImageView];
    [self setupNameLabel];
    [self setupDescriptionLabel];
}

-(void)setupSeparator {
    self.separator = [UIView new];
    self.separator.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.separator];
    [self addConstraints:@[
                           [self.separator.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                           [self.separator.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                           [self.separator.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
                           [self.separator.heightAnchor constraintEqualToConstant:5.0]
    ]];
    self.separator.backgroundColor = [UIColor grayColor];
}

-(void)setupImageView {
    self.imageView = [UIImageView new];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.imageView];
    [self addConstraints:@[
                           [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:5.0],
                           [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5.0],
                           [self.imageView.heightAnchor constraintEqualToConstant:80.0],
                           [self.imageView.widthAnchor constraintEqualToConstant:80.0]
    ]];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)setupNameLabel {
    self.nameLabel = [UILabel new];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.nameLabel];
    [self addConstraints:@[
                           [self.nameLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:5.0],
                           [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant: 10.0]
    ]];
}

-(void)setupDescriptionLabel {
    self.descriptionLabel = [UILabel new];
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.descriptionLabel];
    [self addConstraints:@[
                           [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:10.0],
                           [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.leadingAnchor],
                           [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-5.0],
                           [self.descriptionLabel.bottomAnchor constraintEqualToAnchor:self.separator.topAnchor],
    ]];
    self.descriptionLabel.numberOfLines = 0;
}

- (void) displayImage: (NSURL *) URL {
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: URL];
    [self.imageView setImage: [UIImage imageWithData:imageData]];
}

- (void) displayName: (NSString *) name {
    self.nameLabel.text = name;
}

- (void) displayDescription: (NSString *) description {
    self.descriptionLabel.text = description;
}

@end

