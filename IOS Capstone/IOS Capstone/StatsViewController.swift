//
//  StatsViewController.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 11/2/23.
//

import Foundation
import UIKit

class StatsViewController: UIViewController, UITableViewDataSource, NetworkManagerDelegate, UITableViewDelegate {
    
    @IBOutlet weak var statsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        configureTableView()
    }
    
    var pokemon: [Pokemon] = []
    
    func configureTableView() {
        statsTableView.dataSource = self
        statsTableView.delegate = self
    }
    
    func getUsers() {
        NetworkManager.shared.getPokemon()
        NetworkManager.shared.delegate = self
    }
   
    func pokemonRetrieved(Pokemon: [Pokemon]) {
        self.pokemon = Pokemon

        DispatchQueue.main.async {
            self.statsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PokemonReuseID, for: indexPath)
        let currentPokemon = pokemon[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        //content.text = user.firstName
        //content.secondaryText = user.lastName
        //content.secondaryText = user.emailcurrentPokemon.imageName)
        
        cell.contentConfiguration = content
        return cell
    }
}
