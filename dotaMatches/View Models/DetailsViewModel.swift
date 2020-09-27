//
//  DetailsViewModel.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/25/20.
//

import Foundation
import UIKit.UIColor

public class DetailsViewModel {
    private var dotaDetails = DotaDetails()
    
    let id = Box(0)
    let desc = Box(" ")
    let direTeam = Box("DireTeam\n")
    let radiantTeam = Box("RadiantTeam\n")
    let direScore = Box(" ")
    let radiantScore = Box(" ")
    let direTextColor: Box<UIColor?> = Box(nil)
    let radiantTextColor: Box<UIColor?> = Box(nil)
    let direTeamLogo: Box<URL?> = Box(nil)
    let radiantTeamLogo: Box<URL?> = Box(nil)
    let direTeamID = Box(0)
    let radiantTeamID = Box(0)
    
    init() {
        dotaDetails.delegate = self
    }
    
    func fetch(url: String, selectedID: Int?) {
        dotaDetails.fetchData(url: url, selectedID)
    }
}

extension DetailsViewModel: DotaManagerDelegate {
    func didUpdateDota(dota: DotaModel) {
        if let safeGameModeName = dota.gameModeName {
            if let safeGameMode = dota.gameMode {
                self.desc.value.append("GameMode:\n \(safeGameModeName.array[safeGameMode].name)\n")
            }
        }
        if let safeRadiantWin = dota.radiantWin {
            self.desc.value.append(safeRadiantWin ? "RadiantWins!\n" : "DireWins!\n")
        }
        if let safeDuration = dota.duration {
            let time = ConvertToTime().time(interval: Int(safeDuration))
            self.desc.value.append("Duration: \(time)\n")
        }
        if let safeFirstBloodTime = dota.firstBloodTime {
            let time = ConvertToTime().time(interval: Int(safeFirstBloodTime))
            self.desc.value.append("FirstBloodTime: \(time)\n")
        }
        if let safeRadiantScore = dota.radiantScore {
            if let win = dota.radiantWin {
                self.radiantTextColor.value = win ? .green : .red
                self.radiantScore.value.append("\(K.score)\(safeRadiantScore)")
            }
        }
        if let safeDireScore = dota.direScore {
            if let win = dota.radiantWin {
                self.direTextColor.value = win ? .red : .green
                self.direScore.value.append("\(K.score)\(safeDireScore)")
            }
        }
        if let safeRadiantName = dota.radiantTeam?.name {
            self.radiantTeam.value.append("\(K.teamName)\n \(safeRadiantName)\n")
        }
        if let safeDireName = dota.direTeam?.name {
            self.direTeam.value.append("\(K.teamName)\n \(safeDireName)\n")
        }
        if let safeDireLogo = dota.direTeam?.logo_url {
            self.direTeamLogo.value = URL(string: safeDireLogo)
        }
        if let safeRadiantLogo = dota.radiantTeam?.logo_url {
            self.radiantTeamLogo.value = URL(string: safeRadiantLogo)
        }
        if let direID = dota.direTeam?.team_id {
            self.direTeamID.value = direID
        }
        if let radiantID = dota.radiantTeam?.team_id {
            self.radiantTeamID.value = radiantID
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
