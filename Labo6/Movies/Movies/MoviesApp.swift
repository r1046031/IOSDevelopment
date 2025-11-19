//
//  MoviesApp.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

@main
struct MoviesApp: App {
    @State var movieDataStore = MovieDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(movieDataStore)
        }
    }
}
