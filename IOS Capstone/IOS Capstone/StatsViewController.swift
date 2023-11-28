//
//  StatsViewController.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 11/2/23.
//

import Foundation
import UIKit

class StatsViewController: UIViewController, UITableViewDataSource, NetworkManagerDelegate, UITableViewDelegate {
    func detailsRetrieved(details: DetailsResponse) {
        print(details)
    }
    
    
    @IBOutlet weak var statsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
        configureTableView()
    }
    
    var pokemon: [Pokemon] = []
    var move: [Move] = []
    func configureTableView() {
        statsTableView.dataSource = self
        statsTableView.delegate = self
    }
    
    func getDetails() {
        //NetworkManager.shared.getDetails(name: String)
        NetworkManager.shared.delegate = self
    }
   
    func pokemonRetrieved(pokemon: [Pokemon]) {
        self.pokemon = pokemon

        DispatchQueue.main.async {
            self.statsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PokemonReuseID, for: indexPath)
        let currentPokemon = move[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        //content.text =
        //content.secondaryText = user.lastName
        //content.secondaryText = user.emailcurrentPokemon.imageName)
        
        cell.contentConfiguration = content
        return cell
    }
}
