//
//  ACCritterEndPoint.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation

enum ACCritterEndPoint {
    case critterType(type: String)
}

extension ACCritterEndPoint: Endpoint {
    var path: String {
        switch self {
        case .critterType(let type):
            return "\(type)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .critterType:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .critterType:
            return nil
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .critterType:
            return nil
        }
    }
}
