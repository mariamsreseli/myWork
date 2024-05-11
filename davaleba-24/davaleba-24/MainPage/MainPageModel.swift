//
//  MainPageModel.swift
//  davaleba-24
//
//  Created by Mariam Sreseli on 5/8/24.
//


import Foundation

struct Photo: Decodable {
    let id: String
    let urls: Urls
}

struct Urls: Decodable {
   let thumb: String
}
