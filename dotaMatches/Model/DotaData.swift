//
//  DotaModel.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/22/20.
//

import Foundation

//MARK: ParsedMatchesData
struct ParsedMatchesData: Decodable {
    let match_id: Int
}

//MARK: DetailsData
struct DetailsData: Decodable {
    let game_mode: Int
    let radiant_win: Bool
    let duration: Double
    let first_blood_time: Double
    let radiant_score: Int
    let dire_score: Int
    let radiant_team: RadiantTeam
    let dire_team: DireTeam
}

struct RadiantTeam: Decodable {
    let team_id: Int
    let name: String
    let logo_url: String?
}

struct DireTeam: Decodable {
    let team_id: Int
    let name: String
    let logo_url: String?
}

//MARK: GameMode
struct GameArray: Decodable {

    var array: [Name]
    
    private struct DynamicCodingKeys: CodingKey {

        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var tempArray = [Name]()

        for key in container.allKeys {

            let decodedObject = try container.decode(Name.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            tempArray.append(decodedObject)
        }

        tempArray = tempArray.sorted(by: {$0.id < $1.id})
        array = tempArray
    }
}
struct Name: Decodable {
    let id: Int
    let name: String
}

// MARK: TeamsInfo

struct TeamsInfo: Decodable {
    let team_id: Int
    let rating: Double
    let wins: Int
    let losses: Int
    let last_match_time: Double
    let name: String
    let tag: String
}
