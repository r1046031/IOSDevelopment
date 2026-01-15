//
//  ContentView.swift
//  Museums
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(DataManager.self) private var dataManager
    @State var loading = true
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "") {
                if(loading) {
                    ProgressView("Await")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    MuseumHomeView()
                }
            }
            
            Tab("Museum", systemImage: "") {
                MuseumView()
            }
        }
        .task() {
            await dataManager.dataStore.loadData()
            loading = false
        }
    }
}
