//
//  MovieListView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieListView: View {
    @Environment(MovieDataStore.self) var movieDataStore
    @State var loading = true
    
    var body: some View {
        VStack {
            if loading == false {
                Text("\(movieDataStore.movies.movies[0])")
            }
        }
        .task {
            await movieDataStore.loadData()
            loading = false
        }
    }
}
