//
//  ACCritterListViewController.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit

class ACCritterListViewController: UIViewController {
    
    // MARK: - Properties
    var critterType: ACCritterType?
    var mainView: ACCritterListView {
        return self.view as! ACCritterListView
    }

    // MARK: - Initaliser
    init(withCritter critter: ACCritterType) {
        super.init(nibName: nil, bundle: nil)
        self.critterType = critter
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Helpers
    private func setup() {
        view.backgroundColor = .systemBackground
        view = ACCritterListView(withCritter: critterType)
        self.navigationController?.styleNavigationBar(colour: .clear, tintColour: Colour.AnimalCrossingPrimary100 ?? .blue)
    }
}
