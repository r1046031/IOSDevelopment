//
//  MuseumHomeView.swift
//  Museums
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct MuseumHomeView: View {
    @Environment(DataManager.self) private var dataManager
    @State var loading = true
    
    var body: some View {
        @Bindable var dataManager = dataManager
        
        VStack {
            List(dataManager.dataStore.museums, id: \.self, selection: $dataManager.selectedMuseum) { museum in
                VStack {
                    Text(museum.name ?? "Museum")
                    Text(museum.city ?? "")
                    Text(museum.description ?? "")
                }
            }
        }
    }
}
