//
//  ACCritterListView.swift
//  WhatIDidToday
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit

class ACCritterListView: UIView {

    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let viewModel = ACCritterListViewModel()
    
    init(withCritter critter: ACCritterType?) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension ACCritterListView: ACCritterListViewModelOutput {
    func contentRecieved(model: CritterResponseModel) {
        tableView.reloadData()
    }
    
    func requestFailed(error: String) {
        // Present an alertview
    }
    
    
}
