//
//  TrackListViewController.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TrackListView {
    
    private let presenter: TrackListPresenter
    
    private let tableView = UITableView()
    
    private let rowHeight: CGFloat = 90.0
    
    init(presenter: TrackListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchOnAirInfo()
    }
    
    private func setupTableView() {
        view.addSubview(tableView, with: [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TrackCell.self)        
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return presenter.shouldDisplayHeader() ? rowHeight : 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if presenter.shouldDisplayHeader() {
            let headerView = StationInfoView()
            presenter.configureHeaderView(headerView)
            return headerView
        }

        return nil
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfTracks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrackCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configureCell(cell, at: indexPath.row)
        return cell
    }
    
    // MARK: - TrackListView
    
    func refreshView() {
        tableView.reloadData()
    }
    
    @objc private func fetchOnAirInfo() {
        presenter.fetchOnAirInfo()
    }
}
