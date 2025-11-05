//
//  LoadAsyncApp.swift
//  LoadAsync
//
//  Created by Ilona Defevere on 04/11/2025.
//

import SwiftUI

@main
struct LoadAsyncApp: App {
    @State var uurroosterDataStore = UurroosterDataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(uurroosterDataStore)
        }
    }
}
