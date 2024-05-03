//
//  catPageModel.swift
//  davaleba-23
//
//  Created by Mariam Sreseli on 5/3/24.
//

import Foundation

struct Breed: Codable {
    let breed: String
    let country: String
    let origin: String
    let coat: String
    let pattern: String
}

struct CatFact: Codable {
    let fact: String
    let length: Int
}

