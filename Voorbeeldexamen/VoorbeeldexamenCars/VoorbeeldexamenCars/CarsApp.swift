//
//  VoorbeeldexamenCarsApp.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 17/12/2025.
//

import SwiftUI

@main
struct CarsApp: App {
    @State private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataManager)
        }
    }
}
