//
//  UINavigationController+Extension.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import UIKit

extension UINavigationController {
    
    func styleNavigationBar(colour: UIColor, tintColour: UIColor) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = colour
        self.navigationBar.tintColor = tintColour
    }
}
