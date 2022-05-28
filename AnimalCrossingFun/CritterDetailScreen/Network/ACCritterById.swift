//
//  ACCritterById.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 28/05/2022.
//

import Foundation

//
//  ACCritterEndPoint.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation

enum ACCritterByIdEndPoint {
    case critterById(type: String, id: Int)
}

extension ACCritterByIdEndPoint: Endpoint {
    
    var path: String {
        switch self {
        case.critterById(let type,  let id):
            return "\(type)/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .critterById:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .critterById:
            return nil
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .critterById:
            return nil
        }
    }
}
