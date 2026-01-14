//
//  ContentView.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            //home favorieten instellingen
            Tab("Home", systemImage: "car") {
                HomeView()
            }
            
            Tab("Favorieten", systemImage: "heart") {
                FavoritesView()
            }
            
            Tab("Instellingen", systemImage: "gear") {
                SettingsView()
            }
        }
    }
}
