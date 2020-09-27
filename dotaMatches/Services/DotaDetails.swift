//
//  DotaDetails.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/22/20.
//

import Foundation

class DotaDetails: DotaManager {
    var gameMode = DotaGameMode()
    
    var gameModeName: GameArray?
    
    override init() {
        super.init()
        gameMode.delegate = self
        gameMode.fetchData(url: K.gameModeUrl)
    }
    
    override func fetchData(url: String, _ id: Int?) {
        guard let safeID = id else {
            fatalError("Please provide id")
        }
        let urlString = "\(url)\(safeID)"
        performRequest(with: urlString)
        
    }
    
    override func parseJSON(_ dotaData: Data) -> DotaModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(DetailsData.self, from: dotaData)
            
            let dotaModel = DotaModel(gameModeName: gameModeName, gameMode: decodedData.game_mode, radiantWin: decodedData.radiant_win, duration: decodedData.duration, firstBloodTime: decodedData.first_blood_time, radiantScore: decodedData.radiant_score, direScore: decodedData.dire_score, radiantTeam: decodedData.radiant_team, direTeam: decodedData.dire_team)
            return dotaModel
        } catch {
            print(error)
            return nil
        }
    }
}

extension DotaDetails: DotaManagerDelegate{
    func didUpdateDota(dota: DotaModel) {
        gameModeName = dota.gameModeName
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
