//
//  CritterResponseModel.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation

struct CritterResponseModel: Codable {
    let id: Int
    let fileName: String
    let name: Name
    let availability: Availability
    let shadow: String
    let price, priceCj: Float?
    let catchPhrase, museumPhrase: String
    let imageURI, iconURI: String?
    let altCatchPhrase: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case fileName = "file-name"
        case name, availability, shadow, price
        case priceCj = "price-cj"
        case catchPhrase = "catch-phrase"
        case museumPhrase = "museum-phrase"
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
        case altCatchPhrase = "alt-catch-phrase"
    }
}
