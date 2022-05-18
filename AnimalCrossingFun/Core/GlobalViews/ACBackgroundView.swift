//
//  ACBackgroundView.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 13/05/2022.
//

import UIKit
import PinLayout

class ACBackgroundView: UIView {
    
    private let backgroundView = ACWaveView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.pin.all()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        addSubview(backgroundView)
        backgroundColor = .systemBackground
    }
}

