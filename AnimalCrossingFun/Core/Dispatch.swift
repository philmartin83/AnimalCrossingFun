//
//  Dispatch.swift
//  Totem
//
//  Created by Andrew Birdsall on 28/04/2016.
//  Copyright © 2016 Daniel Atherton. All rights reserved.
//

import Foundation

class Dispatch {
    class func onBackgroundQueue(_ delay: Double, closure: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    class func onMainQueue(_ delay: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    class func onBackgroundQueue(_ closure: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: closure)
    }
    
    class func onMainQueue(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async(execute: closure)
    }
}
