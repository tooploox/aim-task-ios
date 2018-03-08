//
//  TrackCell.h
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface TrackCell : UITableViewCell {}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *artistLabel;
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *durationLabel;

- (void) displayImage: (NSURL *) URL;
- (void) displayTitle: (NSString *) title;
- (void) displayArtist: (NSString *) artist;
- (void) displayDuration: (NSString *) duration;

@end
