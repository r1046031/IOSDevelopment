//
//  WKDataStore.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import Foundation

class WKDataStore {
//    let matchNumber: Int
//    let dateUTC: Date
//    let location: String
//    let homeTeam: String
//    let awayTeam: String
//    let group: String?
//    let homeTeamScore: Int?
//    let awayTeamScore: Int?
    var wkResults: [WKResult] = []
    
    init() {
        wkResults = load("results.json")
    }
    
    func getAllTeams() -> (String) {
        for(item : wkResults) {
            
        }
    }
}
