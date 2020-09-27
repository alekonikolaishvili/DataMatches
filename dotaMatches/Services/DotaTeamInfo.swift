//
//  DotaTeamInfo.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/26/20.
//

import Foundation

class DotaTeamInfo: DotaManager {
    override func fetchData(url: String, _ id: Int? = nil) {
        guard let safeID = id else {
            fatalError("Please provide id")
        }
        let urlString = "\(url)\(safeID)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    override func parseJSON(_ dotaData: Data) -> DotaModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(TeamsInfo.self, from: dotaData)

            let dotaModel = DotaModel(teamID: decodedData.team_id, rating: decodedData.rating, wins: decodedData.wins, losses: decodedData.losses, lastMatchTime: decodedData.last_match_time, name: decodedData.name, tag: decodedData.tag)
            return dotaModel
        } catch {
            print(error)
            return nil
        }
    }
    
    
    
}
