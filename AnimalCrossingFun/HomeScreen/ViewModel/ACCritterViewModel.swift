//
//  WITDCritterViewModel.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation

enum ACCritterType: CaseIterable {
    case fish
    case seaCreature
    case bugs
    case fossils
    
    var critterDescription: String {
        switch self {
        case .fish:
            return "Fish"
        case .seaCreature:
            return "Sea Creatures"
        case .bugs:
            return "Bugs"
        case .fossils:
            return "Fossils"
        }
    }
    var critterURL: String {
        switch self {
        case .fish:
            return "fish"
        case .seaCreature:
            return "sea"
        case .bugs:
            return "bugs"
        case .fossils:
            return "fossils"
        }
    }
}

protocol ACCritterViewOutput: AnyObject {
    func crittersCollected(critters: [CritterModel])
}

class ACCritterViewModel {
    
    // MARK: - Properties
    weak var output: ACCritterViewOutput?
    
    // MARK: - Public Helpers
    func getAllCritters() {
        var critters = [CritterModel]()
        ACCritterType.allCases.forEach { type in
            let model = CritterModel(critterType: type)
            critters.append(model)
        }
        output?.crittersCollected(critters: critters)
    }
}

struct CritterModel {
    let critterType: ACCritterType
}
