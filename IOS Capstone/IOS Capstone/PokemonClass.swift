//
//  PokemonClass.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 10/28/23.
//

import Foundation
struct Pokemon: Codable {
    let pokemon: Int
    let stat: String
    let type: String
    let region: String
}

struct UserResponse: Codable {
    let data: [Pokemon]
}
