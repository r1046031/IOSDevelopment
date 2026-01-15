//
//  VoorbeeldExamenCars2App.swift
//  VoorbeeldExamenCars2
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

@main
struct VoorbeeldExamenCars2App: App {
    @State private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataManager)
        }
    }
}
