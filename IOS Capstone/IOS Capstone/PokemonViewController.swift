//
//  PokemonViewController.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 11/2/23.
//

import Foundation
import UIKit

class PokemonViewController: UIViewController, UITableViewDataSource, NetworkManagerDelegate, UITableViewDelegate {
    
    
    

    

    
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
    
    func pokemonRetrieved(Pokemon: [Pokemon]) {
        self.pokemon = Pokemon

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
        let categories = categories[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = categories
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        let expenseVC = storyboard!.instantiateViewController(withIdentifier: "ExpensesViewController")
            self.navigationController?.pushViewController(expenseVC, animated: true)

        }
    
    }
