//
//  CarsApp.swift
//  Cars
//
//  Created by Ilona Defevere on 16/12/2025.
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
