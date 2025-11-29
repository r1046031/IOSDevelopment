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
    @Binding var selectedMatch: WKResult?
    @Environment(WKDataStore.self) var wkDataStore
    
    var body: some View {
        let results = wkDataStore.getAllResultsByLocation(selectedLocation: "\(selectedLocation ?? "")")
        
        VStack {
            List(results, id: \.self, selection: $selectedMatch){
                result in
                VStack {
                    HStack {
                        Grid {
                            GridRow {
                                if(result.homeTeam == selectedTeam) {
                                    Text(result.homeTeam)
                                        .foregroundColor(Color.red)
                                } else {
                                    Text(result.homeTeam)
                                }
                                Text("X")
                                if(result.awayTeam == selectedTeam) {
                                    Text(result.awayTeam)
                                        .foregroundColor(Color.red)
                                } else {
                                    Text(result.awayTeam)
                                }
                            }
                            if(result.homeTeamScore != nil) {
                                GridRow {
                                    Text(String(result.homeTeamScore!))
                                    Text("-")
                                    Text(String(result.awayTeamScore!))
                                }
                            }
                        }
                    }
                }
                
            }
            }
        }
    }
