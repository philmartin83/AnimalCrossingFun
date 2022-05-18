//
//  ACHomeView.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit
import FlexLayout
import PinLayout

protocol ACHomeViewDelegate: AnyObject {
    func presentDetailList(critterType: ACCritterType)
}

class ACHomeView: ACBackgroundView {

    // MARK: - Properties
    private let rootFlexContainer = UIView()
    private let dataSource = ACHomeTableViewDataSource()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    weak var delegate: ACHomeViewDelegate?
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addCells()
        addChildViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        dataSource.viewDelegate = self
        dataSource.setup()
        tableView.dataSource = dataSource
        tableView.separatorColor = .clear
        addSubview(rootFlexContainer)
    }
    
    private func addCells() {
        tableView.register(ACCritterTableViewCell.self, forCellReuseIdentifier: ACCritterTableViewCell.reuseidentifier)
        tableView.register(ACProfileTableViewCell.self, forCellReuseIdentifier: ACProfileTableViewCell.reuseidentifier)
    }
    
    private func addChildViews() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(tableView).backgroundColor(.clear).width(100%).height(100%)
        }
    }
    
}

extension ACHomeView: ACCritterTableViewDelegate {
    func presentModal(critter: ACCritterType) {
        delegate?.presentDetailList(critterType: critter)
    }
    
    func updateView() {
        tableView.reloadData()
    }
}
