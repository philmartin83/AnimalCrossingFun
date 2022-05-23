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
    var isLightColour = false
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.styleNavigationBar(colour: .systemBackground, tintColour: Colour.AnimalCrossingPrimary100 ?? .blue)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isLightColour ? .lightContent : .darkContent
    }
    
    // MARK: - Private Helpers
    private func setup() {
        edgesForExtendedLayout = []
        view.backgroundColor = .systemBackground
        view = ACCritterListView(withCritter: critterType)
        mainView.delegate = self
        self.navigationController?.styleNavigationBar(colour: .systemBackground, tintColour: Colour.AnimalCrossingPrimary100 ?? .blue)
    }
}

//MARK: - ACCritter List View Delegate
extension ACCritterListViewController: ACCritterListViewDelegate {
    func adjustNavigationBar(addColour: Bool) {
        if addColour {
            self.navigationController?.styleNavigationBar(colour: .systemBackground, tintColour: Colour.AnimalCrossingPrimary100 ?? .blue)
            isLightColour = false
        } else {
            isLightColour = true
            self.navigationController?.styleNavigationBar(colour: Colour.AnimalCrossingPrimary100 ?? .blue , tintColour: .white)
        }
        UIView.animate(withDuration: 0.4) {
            self.setNeedsStatusBarAppearanceUpdate()
            self.navigationController?.navigationBar.layoutIfNeeded()
        }
    }
}

class NavigationController : UINavigationController {
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        
        if let topVC = viewControllers.last {
            //return the status property of each VC, look at step 2
            return topVC.preferredStatusBarStyle
        }
        
        return .default
    }
}
