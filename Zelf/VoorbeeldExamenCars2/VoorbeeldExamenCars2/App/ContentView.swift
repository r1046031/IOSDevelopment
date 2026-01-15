//
//  ContentView.swift
//  VoorbeeldExamenCars2
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(DataManager.self) private var dataManager
    @State var loading = true
    
    var body: some View {
        TabView() {
            Tab("Cars", systemImage: "") {
                if(loading) {
                    ProgressView("Loading")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    CarHomeView()
                }
            }
            
            Tab("Favorites", systemImage: "") {
                FavoritesView()
            }
            
            Tab("Settings", systemImage: "") {
                SettingsView()
            }
        }
        .task {
            await dataManager.dataStore.loadCars()
            loading = false
        }
    }
}
