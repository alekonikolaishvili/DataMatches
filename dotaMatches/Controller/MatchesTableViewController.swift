//
//  TableViewController.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/22/20.
//

import UIKit

class MatchesTableViewController: UITableViewController {
    private let matchesViewModel = MatchesViewModel()
    private var dataMatchesIDs = Array<ParsedMatchesData>()

    override func viewDidLoad() {
        super.viewDidLoad()

        matchesViewModel.matchesData.bind {[weak self] matchesData in
            if let safeMatchesData = matchesData {
                self?.dataMatchesIDs = safeMatchesData
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMatchesIDs.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = String(dataMatchesIDs[indexPath.row].match_id)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.goToDetails, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailsViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedID = dataMatchesIDs[indexPath.row].match_id
        }
    }
}
