//
//  ContentView.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 17/12/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "photo.on.rectangle")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites",
                          systemImage: "photo.on.rectangle")
                }

            SettingsView()
                .tabItem {
                    Label("Settings",
                          systemImage: "photo.on.rectangle")
                }
        }
    }
}
