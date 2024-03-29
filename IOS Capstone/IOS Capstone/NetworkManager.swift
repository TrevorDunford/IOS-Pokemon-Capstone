//
//  NetworkManager.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 10/28/23.
//

import Foundation
protocol NetworkManagerDelegate: AnyObject {
    func pokemonRetrieved(pokemon: [Pokemon])
    func detailsRetrieved(details: DetailsResponse)
}
class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://pokeapi.co/api/v2/"
    
    private init() {}
    
    var delegate: NetworkManagerDelegate?
    
    func getPokemon() {
        let endpoint = baseUrl + "pokemon"
        
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                
                let pokemonResponse = try decoder.decode(PokemonResponse.self, from: data)
                
                self.delegate?.pokemonRetrieved(pokemon: pokemonResponse.results)
                print(pokemonResponse)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
    func getDetails(name: String) {
        let endpoint = baseUrl + "pokemon/\(name)"
        
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
           
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
            
                let detailsResponse = try decoder.decode(DetailsResponse.self, from: data)
                
                self.delegate?.detailsRetrieved(details: detailsResponse)
                print(detailsResponse)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
    
}

