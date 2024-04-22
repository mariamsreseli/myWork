//
//  Struct.swift
//  davaleba20
//
//  Created by Mariam Sreseli on 4/21/24.
//

import UIKit

struct country: Codable {
    let name: Name?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let independent: Bool?
    let status: String?
    let capital: [String]?
    let maps: Map?
    let flags: Flags?
    let capitalInfo: capitalInfo?
    let postalCode: postalCode?
}

struct Name: Codable {
    let common: String?
    let official: String?
}

struct Map: Codable {
    let googleMaps: String?
    let openStreetMaps: String?
    
    enum CodingKeys: String, CodingKey {
        case googleMaps = "googleMaps"
        case openStreetMaps = "openStreetMaps"
    }
}

struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?
}

struct postalCode: Codable {
    let format: String?
    let regex: String?
}

struct capitalInfo: Codable {
    let latlng: [Double]?
}

class Struct: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
