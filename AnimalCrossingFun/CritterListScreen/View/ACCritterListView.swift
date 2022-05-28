//
//  ACCritterListView.swift
//  WhatIDidToday
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit
import FlexLayout

protocol ACCritterListViewDelegate: AnyObject {
    func adjustNavigationBar(addColour: Bool)
    func critterSelected(id: Int, type: String)
}

class ACCritterListView: ACBackgroundView {

    // MARK: - Private Properties
    private let rootFlexContainer = UIView()
    private let dataSource = ACCritterListDataSource()
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let viewModel = ACCritterListViewModel()
    private var type: ACCritterType?
    
    // MARK: - Public Properties
    weak var delegate: ACCritterListViewDelegate?
    
    // MARK: - Initaliser
    init(withCritter critter: ACCritterType?) {
        super.init(frame: .zero)
        self.type = critter
        registerCells()
        setup(critterType: critter!)
        addChildViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }
    
    // MARK: - Private Helpers
    private func setup(critterType: ACCritterType) {
        viewModel.output = self
        viewModel.fetch(critterType: critterType)
        dataSource.viewDelegate = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.sectionHeaderTopPadding = 0
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.separatorColor = .clear
        addSubview(rootFlexContainer)
    }
    
    private func registerCells() {
        tableView.register(ACCritterListTableViewCell.self, forCellReuseIdentifier: ACCritterListTableViewCell.reuseidentifier)
    }
    
    private func addChildViews() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(tableView).backgroundColor(.clear).width(100%).height(100%)
        }
    }
    
}

//MARK: - ACCritter List View Model Output
extension ACCritterListView: ACCritterListViewModelOutput {
    func contentRecieved(model: [CritterResponseModel]) {
        dataSource.setData(critterModel: model)
        Dispatch.onMainQueue {
            self.tableView.reloadData()
        }
    }
    
    func requestFailed(error: String) {
        print(error)
        // Present an alertview future development
    }

}

// MARK: - ACCritter List Data Source Delegate
extension ACCritterListView: ACCritterListDataSourceDelegate {
    func adjustNavigationBar(addColour: Bool) {
        delegate?.adjustNavigationBar(addColour: addColour)
    }
    
    func critterSelected(id: Int) {
        delegate?.critterSelected(id: id, type: type!.critterURL)
    }
}
