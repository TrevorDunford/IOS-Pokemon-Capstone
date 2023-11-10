//
//  NetworkManager.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 10/28/23.
//

import Foundation
protocol NetworkManagerDelegate: AnyObject {
    func pokemonRetrieved(Pokemon: [Pokemon])
}
class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://pokeapi.co/api/v2/"
    
    private init() {}
    
    var delegate: NetworkManagerDelegate?
                                                  
    func getPokemon() {
        let endpoint = baseUrl + "users"
        
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
            
                let userResponse = try decoder.decode(UserResponse.self, from: data)
                
                self.delegate?.pokemonRetrieved(Pokemon: userResponse.data)
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
