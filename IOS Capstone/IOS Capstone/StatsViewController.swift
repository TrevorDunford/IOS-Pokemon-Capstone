//
//  StatsViewController.swift
//  IOS Capstone
//
//  Created by Trevor Dunford on 11/2/23.
//

import Foundation
import UIKit

class StatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var statsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    var pokemon: [Pokemon] = []
    
    var detailsResponse: DetailsResponse? {
        didSet {
            DispatchQueue.main.async {
                self.statsTableView.reloadData()
            }
        }
    }
    
    func configureTableView() {
        statsTableView.dataSource = self
        statsTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PokemonReuseID, for: indexPath)
        let content = cell.defaultContentConfiguration()
        //content.text =
        if indexPath.row == 0 {
          var moves = detailsResponse!.moves
            for move in moves {
                print(move)

            }
        }
        
        //cell.contentConfiguration = content
        return cell
    }
}
