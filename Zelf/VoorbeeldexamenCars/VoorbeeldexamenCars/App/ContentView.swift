//
//  ContentView.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(DataManager.self) private var dataManager
    @State private var loading = false
    
    var body: some View {
        NavigationStack {
            TabView {
                Tab("Home", systemImage: "car") {
                    if(loading) {
                        ProgressView("Loading")
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                    } else {
                        HomeView()
                    }
                }
                
                Tab("Favorieten", systemImage: "heart") {
                    FavoritesView()
                }
                
                Tab("Instellingen", systemImage: "gear") {
                    SettingsView()
                }
            }
//            .navigationDestination(for: Destination.self) { destination in
//                switch destination {
//                    case .favorites:
//                        FavoritesView()
//                    
//                    case .home:
//                        HomeView()
//                    
//                    case .settings:
//                        SettingsView()
//                }
//            }
            .task {
                await dataManager.loadCars()
                loading = false
            }
        }
    }
}
