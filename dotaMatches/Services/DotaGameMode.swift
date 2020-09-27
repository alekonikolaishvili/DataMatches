//
//  DotaGameMode.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/23/20.
//

import Foundation

class DotaGameMode: DotaManager {
    override func fetchData(url: String, _ id: Int? = nil) {
        performRequest(with: url)
    }
    
    override func parseJSON(_ dotaData: Data) -> DotaModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(GameArray.self, from: dotaData)
            
            let dotaModel = DotaModel(gameModeName: decodedData)
            
            return dotaModel
        } catch {
            print(error)
            return nil
        }
    }
}
