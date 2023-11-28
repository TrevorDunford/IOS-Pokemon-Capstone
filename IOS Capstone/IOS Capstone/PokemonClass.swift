//
//  PokemonClass.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 10/28/23.
//

import Foundation

struct PokemonResponse: Codable {
    let results: [Pokemon]
}
struct DetailsResponse: Codable {
    let types: [TypeElement]
    let moves: [Move]
}
struct Pokemon: Codable {
    let name: String
    let url: String
}

struct Move: Codable {
    let move: MoveDetails

}

struct MoveDetails: Codable {
    let name: String
    let url: String
}

struct TypeElement: Codable {
    let slot: Int
    let type: TypeDetails
}

struct TypeDetails: Codable {
    let name: String
    let url: String
}
