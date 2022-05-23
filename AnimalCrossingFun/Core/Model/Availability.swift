//
//  Availability.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation

struct Availability: Codable {
    let monthNorthern, monthSouthern: String
    let time: Time
    let isAllDay, isAllYear: Bool
    let location: Location?
    let rarity: Rarity?
    let monthArrayNorthern, monthArraySouthern, timeArray: [Int]

    enum CodingKeys: String, CodingKey {
        case monthNorthern = "month-northern"
        case monthSouthern = "month-southern"
        case time, isAllDay, isAllYear, location, rarity
        case monthArrayNorthern = "month-array-northern"
        case monthArraySouthern = "month-array-southern"
        case timeArray = "time-array"
    }
}

// MARK: - Location
enum Location: String, Codable {
    case nearFlowers = "Flying near hybrid flowers"
    case flying = "Flying"
    case pier = "Pier"
    case pond = "Pond"
    case river = "River"
    case riverClifftop = "River (Clifftop)"
    case riverClifftopPond = "River (Clifftop) & Pond"
    case riverMouth = "River (Mouth)"
    case sea = "Sea"
    case seaWhenRainingOrSnowing = "Sea (when raining or snowing)"
}

// MARK: - Rarity
enum Rarity: String, Codable {
    case common = "Common"
    case rare = "Rare"
    case ultraRare = "Ultra-rare"
    case uncommon = "Uncommon"
}

// MARK: - Time
enum Time: String, Codable {
    case empty = ""
    case the4Am5Pm = "4am - 5pm"
    case the4Am7Pm = "4am - 7pm"
    case the4Am9Pm = "4am - 9pm"
    case the4Pm9Am = "4pm - 9am"
    case the9Am4Pm = "9am - 4pm"
    case the8Am7Pm = "8am - 7pm"
    case the9Am4Pm9Pm4Am = "9am - 4pm & 9pm - 4am"
    case the5Pm8Am = "5pm - 8am"
    case the9Pm4Am = "9pm - 4am"
}
