//
//  ScoreListView.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

struct ScoreListView: View {
    @Binding var selectedTeam: String?
    @Binding var selectedLocation: String?
    @Binding var selectedMatch: String?
    @Environment(WKDataStore.self) var wkDataStore
    
    var body: some View {
        let results = wkDataStore.getAllResultsByLocation(selectedLocation: "\($selectedLocation)")
        VStack {
            Text(results[0].awayTeam)
//            ForEach(results, id: \.matchNumber) { result in
//                VStack {
//                    Grid {
//                        GridRow {
//                            Text(result.homeTeam)
//                            Text("X")
//                            Text(result.awayTeam)
//                        }
////                        if(result.homeTeamScore != nil) {
////                            GridRow {
////                                Text(result.homeTeamScore)
////                                Text("-")
////                                Text(result.awayTeamScore)
////                              }
////                        }
//                    }
//                }
//            }
        }
    }
}
