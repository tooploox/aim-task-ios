//
//  TrackListViewController.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "TrackListViewController.h"

#import "TrackCell.h"

@implementation TrackListViewController

static NSString *cellIdentifier = @"TrackCell";
static CGFloat rowHeight = 90.0;


- (instancetype)initWithPresenter:(TrackListPresenter *)presenter {
    self = [super init];

    if (self != nil) {
        self.presenter = presenter;
        return self;
    }
    return nil;
}

- (void)loadView {
    [super loadView];
    self.view = [[UIView new]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self fetchOnAirInfo];
}

- (void)setupTableView {
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    [self.view addConstraints:@[
                           [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                           [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                           [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                           [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[TrackCell self] forCellReuseIdentifier:cellIdentifier];
}

// MARK: - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self.presenter shouldDisplayHeader]) {
        return rowHeight;
    } else {
        return 0.0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([self.presenter shouldDisplayHeader]) {
        StationInfoView *headerView = [StationInfoView new];
        [self.presenter configureHeaderView:headerView];
        return headerView;
    }
    return nil;
}

//MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.presenter numberOfTracks];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TrackCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [self.presenter configureCell:cell atIndex:indexPath.row];
    return cell;
}

// MARK: - TrackListView

- (void) refreshView {
    [self.tableView reloadData];
}

- (void) fetchOnAirInfo {
    [self.presenter fetchOnAirInfo];
}

@end
