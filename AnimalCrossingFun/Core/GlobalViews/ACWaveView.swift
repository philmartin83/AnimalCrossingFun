//
//  ACWaveView.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 13/05/2022.
//

import UIKit

class ACWaveView: UIView {
    
    let graphWidth: CGFloat = 0.15
    let amplitude: CGFloat = 0.006
    
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        
        let origin = CGPoint(x: 0, y: height * 0.40)
        
        let path = UIBezierPath()
        path.move(to: origin)
        
        var endY: CGFloat = 0.0
        let step = 5.0
        for angle in stride(from: step, through: Double(width) * (step * step), by: step) {
            let x = origin.x + CGFloat(angle/360.0) * width * graphWidth
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
            endY = y
        }
        path.addLine(to: CGPoint(x: width, y: endY))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: origin.y))
        
        // Owning the bang here because the colour should never be nil
        Colour.AnimalCrossingPrimary100!.setFill()
        path.fill()
        UIColor.systemBackground.setStroke()
        path.stroke()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor =  .systemBackground
        clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
