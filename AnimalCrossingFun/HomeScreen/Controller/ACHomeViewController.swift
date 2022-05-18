//
//  ACHomeViewController.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit

class ACHomeViewController: UIViewController {
    
    // MARK: - Properties
    var mainView: ACHomeView {
        return self.view as! ACHomeView
    }

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Helpers
    private func setup() {
        view.backgroundColor = .systemBackground
        view = ACHomeView()
        mainView.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

// MARK: - ACHomeViewDelegate
extension ACHomeViewController: ACHomeViewDelegate {
    func presentDetailList(critterType: ACCritterType) {
        let detailList = ACCritterListViewController(withCritter: critterType)
        self.navigationController?.pushViewController(detailList, animated: true)
    }
}

