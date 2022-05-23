//
//  UINavigationController+Extension.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit

extension UINavigationController {
    
    func styleNavigationBar(colour: UIColor, tintColour: UIColor) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = colour
        navBarAppearance.shadowColor = .clear
        navigationBar.tintColor = tintColour
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
