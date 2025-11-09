//
//  ListStadionView.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

struct ListStadionView: View {
    @Environment(WKDataStore.self) var wkDataStore
    @Binding var selectedLocation: String?
    
    var body: some View {
        List(wkDataStore.getAllLocations(), id: \.self, selection: $selectedLocation){
            location in
            Text(location)
        }
    }
}
