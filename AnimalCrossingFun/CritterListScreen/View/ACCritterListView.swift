//
//  ACCritterListView.swift
//  WhatIDidToday
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit
import FlexLayout

class ACCritterListView: ACBackgroundView {

    private let rootFlexContainer = UIView()
    private let dataSource = ACCritterListDataSource()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let viewModel = ACCritterListViewModel()
    
    init(withCritter critter: ACCritterType?) {
        super.init(frame: .zero)
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
        tableView.dataSource = dataSource
        tableView.separatorColor = .clear
        addSubview(rootFlexContainer)
    }
    
    private func addChildViews() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(tableView).backgroundColor(.clear).width(100%).height(100%)
        }
    }
    
}

extension ACCritterListView: ACCritterListViewModelOutput {
    func contentRecieved(model: CritterResponseModel) {
//        dataSource.setData(critterModel: model)
        tableView.reloadData()
    }
    
    func requestFailed(error: String) {
        print(error)
        // Present an alertview future development
    }

}
