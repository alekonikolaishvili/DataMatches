//
//  TeamInfoViewModel.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/26/20.
//

import Foundation

public class TeamInfoViewModel {
    private var dotaTeamsInfo = DotaTeamInfo()
    let info = Box("TeamInfo\n")
    
    init() {
        dotaTeamsInfo.delegate = self
    }
    
    func fetch(url: String, selectedID: Int?) {
        dotaTeamsInfo.fetchData(url: url, selectedID)
    }
}

extension TeamInfoViewModel: DotaManagerDelegate {
    func didUpdateDota(dota: DotaModel) {
        if let safeTeamID = dota.teamID {
            info.value.append("TeamID: \(safeTeamID)\n")
            print(safeTeamID)
        }
        if let safeRating = dota.rating {
            info.value.append("Rating: \(safeRating)\n")
        }
        if let safeWins = dota.wins {
            info.value.append("Wins: \(safeWins)\n")
        }
        if let losses = dota.losses {
            info.value.append("Losses: \(losses)\n")
        }
        if let safeLastMatchTime = dota.lastMatchTime {
            let time = ConvertToTime().time(interval: Int(safeLastMatchTime))
            info.value.append("Last Match Time: \(time)\n")
        }
        if let safeName = dota.name {
            info.value.append("TeamName: \(safeName)\n")
        }
        if let safeTag = dota.tag {
            info.value.append("Tag: \(safeTag)")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
