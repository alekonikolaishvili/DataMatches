//
//  DotaMatches.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/22/20.
//

import Foundation

class DotaMatches: DotaManager {
    override func fetchData(url: String, _ id: Int? = nil) {
        performRequest(with: url)
    }
    
    override func parseJSON(_ dotaData: Data) -> DotaModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([ParsedMatchesData].self, from: dotaData)
            
            let dotaModel = DotaModel(matchID: decodedData)
            return dotaModel
        } catch {
            print(error)
            return nil
        }
    }
}
