//
//  ACCritterListDataSource.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation
import UIKit

protocol ACCritterListDataSourceDelegate: AnyObject {
    func adjustNavigationBar(addColour: Bool)
    func critterSelected(id: Int)
}

class ACCritterListDataSource: NSObject {

    // MARK: - Private Properties
    private let lastContentOffset: CGFloat = 0
    private var critterResponse: [CritterResponseModel]?
    
    // MARK: - Public Properties
    weak var viewDelegate: ACCritterListDataSourceDelegate?
    
    // MARK: - Public Helper
    func setData(critterModel: [CritterResponseModel]) {
        self.critterResponse = critterModel
    }
}

// MARK: - UITableView DataSource
extension ACCritterListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return critterResponse?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = critterResponse?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ACCritterListTableViewCell.reuseidentifier, for: indexPath) as! ACCritterListTableViewCell
        cell.populate(critter: data)
        cell.selectionColor = .clear
        return cell
    }
}

// MARK: - UITableView Delegate
extension ACCritterListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = critterResponse?[indexPath.row]
        viewDelegate?.critterSelected(id: data?.id ?? 0)
    }
}

// MARK: - UIScrollView View Delegate
extension ACCritterListDataSource: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            // moved to top
            viewDelegate?.adjustNavigationBar(addColour: false)
        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
            // moved to bottom
            viewDelegate?.adjustNavigationBar(addColour: true)
        }
    }
}
