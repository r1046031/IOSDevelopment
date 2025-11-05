//
//  Labo4_WKQuatarApp.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

@main
struct Labo4_WKQuatarApp: App {
    @State var wkDataStore = WKDataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(wkDataStore)
        }
    }
}
