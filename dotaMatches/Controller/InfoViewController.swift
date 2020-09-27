//
//  InfoViewController.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/26/20.
//

import UIKit

class InfoViewController: UIViewController {
    private let teamInfoViewModel = TeamInfoViewModel()
    @IBOutlet weak var teamDetails: UILabel!
    
    var selectedTeamID: Int? {
        didSet{
           teamInfoViewModel.fetch(url: K.teamInfoUrl, selectedID: selectedTeamID)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // teamInfoViewModel.fetch(url: K.teamInfoUrl, selectedID: 7314697)
        teamInfoViewModel.info.bind{[weak self] info in
            DispatchQueue.main.async {
                self?.teamDetails.text = info
            }
            
        }
    }
}
