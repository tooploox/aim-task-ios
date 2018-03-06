//
//  TrackListViewController.m
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "TrackListViewController.h"

@interface TrackListViewController () {
    
    TrackListPresenter *presenter;
    UITableView *tableView;
//    CGFloat rowHeight = 90.0;
    
}

@end

@implementation TrackListViewController

- (id)initWithPresenter:(TrackListPresenter *)presenter {
    self = [super init];

    if (self != nil) {
        presenter = presenter;
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
//    setupTableView;
//    fetchOnAirInfo;
}

- (void)setupTableView {
    //private func setupTableView() {
    //    view.addSubview(tableView, with: [
    //                                      tableView.topAnchor.constraint(equalTo: view.topAnchor),
    //                                      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    //                                      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    //                                      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    //                                      ])
    //
    //    tableView.dataSource = self
    //    tableView.delegate = self
    //    tableView.register(TrackCell.self)
    //}
}

// MARK: - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0;//rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([presenter shouldDisplayHeader]) {
        return 90.0;//rowHeight;
    } else {
        return 0.0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([presenter shouldDisplayHeader]) {
        //        let headerView = StationInfoView()
        //        presenter.configureHeaderView(headerView)
        //        return headerView
    }
    return nil;
}

//MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [presenter numberOfTracks];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    let cell: TrackCell = tableView.dequeueReusableCell(for: indexPath)
    //    presenter.configureCell(cell, at: indexPath.row)
    //    return cell
    return [UITableViewCell init];
}

// MARK: - TrackListView

- (void) refreshView {
    [tableView reloadData];
}

- (void) fetchOnAirInfo {
    [presenter fetchOnAirInfo];
}

@end
