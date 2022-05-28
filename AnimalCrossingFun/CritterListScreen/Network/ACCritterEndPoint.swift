//
//  ACCritterEndPoint.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation

enum ACCritterEndPoint {
    case critterType(type: String)
    case critterById(type: String, id: String)
}

extension ACCritterEndPoint: Endpoint {
    
    var path: String {
        switch self {
        case .critterType(let type):
            return "\(type)"
        case .critterById(type: let type, id: let id):
            return "\(type)/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .critterType, .critterById:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .critterType, .critterById:
            return nil
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .critterType, .critterById:
            return nil
        }
    }
}
