//
//  Name.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation

// MARK: - Name
struct Name: Codable {
    let nameEUen: String
    enum CodingKeys: String, CodingKey {
        case nameEUen = "name-EUen"
    }
}
