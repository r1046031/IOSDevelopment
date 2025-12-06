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
    @EnvironmentObject var pathStore: PathStore
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            if(loading) {
                Text("loading")
            }
            else {
                List(movieDataStore.movies.movies, id: \.self){
                    movie in
                    NavigationLink(value: Route.movie(movie: movie)) {
                        VStack {
                            Text(movie.title)
                                .fontWeight(.bold)
                            Text(movie.description)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                        case let .actor(actor: actor):
                            MovieActorView(actor: actor)
                        case let .director(director: director):
                            MovieDirectorView(director: director)
                        case let .movie(movie: movie):
                            MovieInformationView(movie: movie)
                    }
                }
            }
        }
        .task {
            await movieDataStore.loadData()
            loading = false
        }
    }
}
