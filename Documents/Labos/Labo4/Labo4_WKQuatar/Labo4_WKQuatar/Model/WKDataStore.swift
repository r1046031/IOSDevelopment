//
//  WKDataStore.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import Foundation

@Observable class WKDataStore {
//    let matchNumber: Int
//    let dateUTC: Date
//    let location: String
//    let homeTeam: String
//    let awayTeam: String
//    let group: String?
//    let homeTeamScore: Int?
//    let awayTeamScore: Int?
    let wkResults: [WKResult]
    
    init() {
        self.wkResults = load("WKResultsQatar.json")
    }
    
    func getAllTeams() -> [String] {
        //filter -> eerst de group die nil is eruit halen
        let matchesWithGroup = wkResults.filter {
            $0.group != nil
        }
        //map -> elk element overlopen (van gefilterde array)
        let awayTeams = matchesWithGroup.map {
            $0.awayTeam
        }
        
        //set voor de dubbele waarden eruit te halen
        return Array(Set(awayTeams)).sorted()
    }
    
    func getAllLocations() -> [String] {
        //map
        let locations = wkResults.map {
            $0.location
        }
        
        //set
        return Array(Set(locations)).sorted()
    }
    
    func getAllResultsByLocation(selectedLocation: String) {
        //filter
        let matchFromLocation = wkResults.filter {
            $0.location == selectedLocation
        }
        //map
        
        //set
        
    }
}
