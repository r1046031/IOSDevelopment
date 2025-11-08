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
    @State var selectedMatch: String?
    @Environment(WKDataStore.self) var wkDataStore
    
    var body: some View {
        var results = wkDataStore.getAllResultsByLocation(selectedLocation: "\($selectedLocation)")
        VStack {
            ForEach(results, id: \.matchNumber) { result in
                NavigationStack {
                    Grid {
                        GridRow {
                            Text(results.homeTeam)
                            Text("X")
                            Text(results[0].homeTeam)
                        }
                        GridRow {
                            Text(results.homeTeamScore)
                            Text("-")
                            Text(results[0].awayTeamScore)
                        }
                    }
                }
            }
        }
        
    }
}
