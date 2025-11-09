//
//  ResultsView.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

struct ResultsView: View {
    @Binding var selectedTeam: String?
    @State var selectedLocation: String?
    @State var selectedMatch: String?
    
    var body: some View {
        NavigationSplitView {
            ListStadionView(selectedLocation: $selectedLocation)
        } content : {
            if let selectedLocation = selectedLocation {
                ScoreListView(selectedTeam: $selectedTeam, selectedLocation: $selectedLocation, selectedMatch: $selectedMatch)
            }
        } detail: {
            if let selectedMatch = selectedMatch {
                DetailGameView(selectedMatch: $selectedMatch)
            }
        }
    }
}
