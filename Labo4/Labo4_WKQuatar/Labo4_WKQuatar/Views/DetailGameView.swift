//
//  DetailGameView.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

struct DetailGameView: View {
    @Binding var selectedMatch: WKResult?
    
    var body: some View {
        VStack {
            Text((selectedMatch!).dateUTC)
            Text((selectedMatch!).location)
            Divider()
            Grid {
                GridRow {
                    Text((selectedMatch!).homeTeam)
                    Text("X")
                    Text((selectedMatch!).awayTeam)
                }
                if((selectedMatch!).homeTeamScore != nil) {
                    GridRow {
                        Text(String((selectedMatch!).homeTeamScore!))
                        Text("-")
                        Text(String((selectedMatch!).awayTeamScore!))
                    }
                }
            }
            Divider()
            Text("Round: " + String((selectedMatch!).roundNumber))
            Text("Group: " + (selectedMatch!).group!)
        }
    }
}
