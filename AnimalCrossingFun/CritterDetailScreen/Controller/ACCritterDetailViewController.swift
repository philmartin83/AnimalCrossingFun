//
//  ACCritterDetailViewController.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 28/05/2022.
//

import UIKit

class ACCritterDetailViewController: UIViewController {
    
    // MARK: - Properties
    var critterId = 0
    var critterType = ""
    
    var mainView: ACCritterListView {
        return self.view as! ACCritterListView
    }
    
    // MARK: - Initaliser
    init(withCritterId id: Int, type: String) {
        super.init(nibName: nil, bundle: nil)
        critterId = id
        critterType = type
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ACCritterDetailView(withCritterId: critterId, type: critterType)
    }

}
