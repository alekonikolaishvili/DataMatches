//
//  DotaModel.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/22/20.
//

import Foundation

struct DotaModel {
    var matchID: [ParsedMatchesData]?
    var gameModeName: GameArray?
    var gameMode: Int?
    var radiantWin: Bool?
    var duration: Double?
    var firstBloodTime: Double?
    var radiantScore: Int?
    var direScore: Int?
    var radiantTeam: RadiantTeam?
    var direTeam: DireTeam?
    var teamID: Int?
    var rating: Double?
    var wins: Int?
    var losses: Int?
    var lastMatchTime: Double?
    var name: String?
    var tag: String?
    
}
