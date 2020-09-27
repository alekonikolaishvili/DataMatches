//
//  DotaMatchesManager.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/22/20.
//

import Foundation

protocol DotaManagerDelegate {
    func didUpdateDota(dota: DotaModel)
    func didFailWithError(error: Error)
}
class DotaManager {
    var delegate: DotaManagerDelegate?
    
    func fetchData(url: String, _ id: Int? = nil) {
       
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                
                    if let getData = self.parseJSON(safeData) {
                        self.delegate?.didUpdateDota(dota: getData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ dotaData: Data) -> DotaModel?{
        return nil
    }
    
}
