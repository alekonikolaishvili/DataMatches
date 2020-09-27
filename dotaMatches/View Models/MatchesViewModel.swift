//
//  MatchesViewModel.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/25/20.
//

import Foundation

public class MatchesViewModel {
    private var dotaMatches = DotaMatches()
    var matchesData: Box<[ParsedMatchesData]?> = Box(nil)
    
    init() {
        dotaMatches.delegate = self
        dotaMatches.fetchData(url: K.parseMatchesUrl)
    }
}

extension MatchesViewModel: DotaManagerDelegate {
    func didUpdateDota(dota: DotaModel) {
        matchesData.value = dota.matchID
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
