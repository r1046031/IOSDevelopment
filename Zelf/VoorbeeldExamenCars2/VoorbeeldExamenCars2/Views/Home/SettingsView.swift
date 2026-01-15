//
//  SettingsView.swift
//  VoorbeeldExamenCars2
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct SettingsView: View {
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
        FilterButton(name: "Prijs", filter: Filter.prijs)
        FilterButton(name: "Merk", filter: Filter.merk)
        FilterButton(name: "Jaar", filter: Filter.jaar)
    }
}

struct FilterButton: View {
    @Environment(DataManager.self) private var dataManager
    var name: String
    var filter: Filter
    
    var body: some View {
        Button(name) {
            dataManager.selectedFilter = filter
        }
    }
}
