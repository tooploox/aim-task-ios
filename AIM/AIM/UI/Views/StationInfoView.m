//
//  StationInfoView.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "StationInfoView.h"
#import <UIKit/UIKit.h>

@interface StationInfoView () {
    
    UILabel *nameLabel;
    UILabel *descriptionLabel;
    UIImageView *imageView;
    UIView *separator;

}

@end

@implementation StationInfoView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectZero];
    [self setupView];
    return self;
}

-(void)setupView {
//    backgroundColor = UIColor.white
    //    [self setupSeparator];
    //    [self setupImageView];
    //    [self setupNameLabel];
    //    [self setupDescriptionlabel];
}

-(void)setupSeparator {
    separator.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:separator];
    [self addConstraints:@[
                           [separator.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                           [separator.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                           [separator.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
                           [separator.heightAnchor constraintEqualToConstant:5.0]
    ]];
    separator.backgroundColor = [UIColor grayColor];
}

-(void)setupImageView {
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:imageView];
    [self addConstraints:@[
                           [imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:5.0],
                           [imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5.0],
                           [imageView.heightAnchor constraintEqualToConstant:80.0],
                           [imageView.widthAnchor constraintEqualToConstant:80.0]
    ]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)setupNameLabel {
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:nameLabel];
    [self addConstraints:@[
                           [nameLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:5.0],
                           [nameLabel.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant: 10.0]
    ]];
}

-(void)setupDescriptionLabel {
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:descriptionLabel];
    [self addConstraints:@[
                           [descriptionLabel.topAnchor constraintEqualToAnchor:nameLabel.bottomAnchor constant:10.0],
                           [descriptionLabel.leadingAnchor constraintEqualToAnchor:nameLabel.leadingAnchor],
                           [descriptionLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-5.0],
                           [descriptionLabel.bottomAnchor constraintEqualToAnchor:separator.topAnchor],
    ]];
    descriptionLabel.numberOfLines = 0;
}

- (void) displayImage: (NSURL *) URL {
    // set image         coverImageTask = coverImageView.setImage(with: URL)
}

- (void) displayName: (NSString *) name {
    nameLabel.text = name;
}

- (void) displayDescription: (NSString *) description {
    descriptionLabel.text = description;
}

@end

