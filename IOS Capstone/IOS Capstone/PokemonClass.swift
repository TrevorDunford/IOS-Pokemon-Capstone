//
//  PokemonClass.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 10/28/23.
//

import Foundation

struct PokemonResponse: Codable {
    let pokemon: [Pokemon]
}

struct Pokemon: Codable {
    //let moves: Move?
   let types: String?
}

struct Move: Codable {
    let move: String?
    let name: String?
}
