//
//  ListStadionView.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

struct ListStadionView: View {
    @Environment(WKDataStore.self) var wkDataStore
    @Binding var selectedTeam: String?
    @State var selectedLocation: String?
    
    var body: some View {
        NavigationStack {
            List(wkDataStore.getAllLocations(), id: \.self, selection: $selectedLocation){
                location in
                Text(location)
            }
            if let selectedLocation = selectedLocation {
                ScoreListView(selectedTeam: $selectedTeam, selectedLocation: $selectedLocation)
            }
        }
    }
}
