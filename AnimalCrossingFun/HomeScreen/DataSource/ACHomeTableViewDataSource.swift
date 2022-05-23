//
//  ACCritterTableViewDataSource.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit

protocol ACCritterTableViewDelegate: AnyObject {
    func updateView()
    func presentModal(critter: ACCritterType)
}

extension ACCritterTableViewDelegate {
    func updateView() {}
    func presentModal(critter: ACCritterType) {}
}


class ACHomeTableViewDataSource: NSObject {
    
    enum HomeSections: CaseIterable {
        case profile
        case critter
    }
    
    private let viewModel = ACCritterViewModel()
    var critters: [CritterModel]?
    weak var viewDelegate: ACCritterTableViewDelegate?
    
    // MARK: - Public Helpers
    func setup() {
        viewModel.output = self
        viewModel.getAllCritters()
    }
}

// MARK: - TableView Data Source
extension ACHomeTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableSection = HomeSections.allCases[section]
        switch tableSection {
        case .profile:
            return 1
        case .critter:
            return critters?.count ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection = HomeSections.allCases[indexPath.section]
        switch tableSection {
        case.profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: ACProfileTableViewCell.reuseidentifier, for: indexPath) as! ACProfileTableViewCell
            cell.selectionColor = .clear
            return cell
        case .critter:
            let critter = critters?[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: ACCritterTableViewCell.reuseidentifier, for: indexPath) as! ACCritterTableViewCell
            cell.populate(critter: critter)
            cell.selectionColor = .clear
            return cell
        }
    }
}

//MARK: - UITableView Delegate
extension ACHomeTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = HomeSections.allCases[indexPath.section]
        switch section {
        case .critter:
            guard let critter = critters?[indexPath.row] else { return }
            viewDelegate?.presentModal(critter: critter.critterType)
        default:
            break
        }
    }
}

//MARK: - ACCritter View Output
extension ACHomeTableViewDataSource: ACCritterViewOutput {
    func crittersCollected(critters: [CritterModel]) {
        self.critters = critters
        viewDelegate?.updateView()
    }
}
