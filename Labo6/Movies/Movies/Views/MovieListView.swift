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
    @State var selectedMovie: Movie?
    
    var body: some View {
        Group {
            if(loading) {
                Text("loading")
            }
            else {
                List(movieDataStore.movies.movies, id: \.self, selection: $selectedMovie){
                    movie in
                    VStack {
                        Text(movie.title)
                            .fontWeight(.bold)
                        Text(movie.description)
                    }
                }.onTapGesture {
                    NavigationLink(destination: MovieInformationView(selectedMovie: $selectedMovie))
                }
            }
        }
        .task {
            await movieDataStore.loadData()
            loading = false
        }
    }
}
