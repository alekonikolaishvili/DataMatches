//
//  ViewController.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/22/20.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    private let detailsViewModel = DetailsViewModel()
    private var direTeamID = 0
    private var radiantTeamID = 0
    private var goToTeamID = 0
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var direTeam: UILabel!
    @IBOutlet weak var radiantTeam: UILabel!
    @IBOutlet weak var direScore: UILabel!
    @IBOutlet weak var radiantScore: UILabel!
    @IBOutlet weak var direLogo: UIImageView!
    @IBOutlet weak var radiantLogo: UIImageView!
    
    var selectedID: Int? {
        didSet{
            detailsViewModel.fetch(url: K.matchesUrl, selectedID: selectedID)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailsViewModel.desc.bind {[weak self] desc in
            DispatchQueue.main.async {
                self?.desc.text = desc
            }
        }
        detailsViewModel.direTeam.bind {[weak self] direTeam in
            DispatchQueue.main.async {
                self?.direTeam.text = direTeam
            }
        }
        detailsViewModel.radiantTeam.bind{[weak self] radiantTeam in
            DispatchQueue.main.async {
                self?.radiantTeam.text = radiantTeam
            }
        }
        detailsViewModel.direScore.bind {[weak self] direScore in
            DispatchQueue.main.async {
                self?.direScore.text = direScore
            }
            
        }
        detailsViewModel.radiantScore.bind{[weak self] radiantScore in
            DispatchQueue.main.async {
                self?.radiantScore.text = radiantScore
            }
            
        }
        detailsViewModel.direTextColor.bind{[weak self] direTextColor in
            DispatchQueue.main.async {
                self?.direScore.textColor = direTextColor
            }
            
        }
        detailsViewModel.radiantTextColor.bind{[weak self] radiantTextColor in
            DispatchQueue.main.async {
                self?.radiantScore.textColor = radiantTextColor
            }
        }
        detailsViewModel.direTeamLogo.bind{[weak self] direTeamLogo in
            DispatchQueue.main.async {
                self?.direLogo.sd_setImage(with: direTeamLogo)
            }
        }
        detailsViewModel.radiantTeamLogo.bind{[weak self] radiantTeamLogo in
            DispatchQueue.main.async {
                self?.radiantLogo.sd_setImage(with: radiantTeamLogo)
            }
        }
        detailsViewModel.direTeamID.bind{[weak self] direTeamID in
            self?.direTeamID = direTeamID
        }
        detailsViewModel.radiantTeamID.bind{[weak self] radiantTeamID in
            self?.radiantTeamID = radiantTeamID
        }
    }
    @IBAction func pressedDireTeam(_ sender: UIBarButtonItem) {
        goToTeamID = direTeamID
        performSegue(withIdentifier: K.goToInfo, sender: self)
    }
    @IBAction func pressedRadiantTeam(_ sender: UIBarButtonItem) {
        goToTeamID = radiantTeamID
        performSegue(withIdentifier: K.goToInfo, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! InfoViewController
        
        destinationVC.selectedTeamID = goToTeamID
    }
    
}


