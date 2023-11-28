//
//  PokemonViewController.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 11/2/23.
//

import Foundation
import UIKit

class PokemonViewController: UIViewController, UITableViewDataSource, NetworkManagerDelegate, UITableViewDelegate {
    func detailsRetrieved(details: DetailsResponse) {
        DispatchQueue.main.async {
            if let statsVC = self.storyboard?.instantiateViewController(withIdentifier: "StatsViewController") as? StatsViewController {
                print("hello")
                self.navigationController?.pushViewController(statsVC, animated: true)
            }
        }
    }
    
    
    @IBOutlet weak var pokemonList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getPokemon()
    }
    
    var pokemon: [Pokemon] = []
    
    func getPokemon() {
        NetworkManager.shared.getPokemon()
        NetworkManager.shared.delegate = self
    }
    
    //we need a way to indentify when shomeone clicked on pokemon
    func pokemonRetrieved(pokemon: [Pokemon]) {
        self.pokemon = pokemon
        print (pokemon)
        DispatchQueue.main.async {
            self.pokemonList.reloadData()
        }
        
    }
    
    func configureTableView() {
        
        pokemonList.delegate = self
        pokemonList.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PokemonReuseID, for: indexPath)
        let pokemon = pokemon[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = pokemon.name
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedPokemon = pokemon[indexPath.row]
        NetworkManager.shared.getDetails(name: selectedPokemon.name)
        if let statsVC = storyboard?.instantiateViewController(withIdentifier: "StatsViewController") as? StatsViewController {
            navigationController?.pushViewController(statsVC, animated: true)
        }
    }
    
    
}
