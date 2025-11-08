//
//  ResultsView.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

struct ResultsView: View {
    @Binding var selectedTeam: String?
    @Binding var selectedLocation: String?
    
    var body: some View {
        NavigationSplitView {
            ListStadionView(selectedTeam: $selectedTeam)
        } content : {
            ScoreListView(selectedTeam: $selectedTeam, selectedLocation: $selectedLocation)
        } detail: {
            DetailGameView()
        }
    }
}
