//
//  VoorbeeldexamenCarsApp.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

@main
struct VoorbeeldexamenCarsApp: App {
    @State private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataManager)
        }
    }
}
