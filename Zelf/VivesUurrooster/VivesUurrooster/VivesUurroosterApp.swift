//
//  VivesUurroosterApp.swift
//  VivesUurrooster
//
//  Created by Ilona on 10/01/2026.
//

import SwiftUI

@main
struct VivesUurroosterApp: App {
    @State var uurroosterDataStore = UurroosterDataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(uurroosterDataStore)
        }
    }
}
