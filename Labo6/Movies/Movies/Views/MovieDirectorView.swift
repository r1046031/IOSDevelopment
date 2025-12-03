//
//  MovieDirectorView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieDirectorView: View {
    @Environment(MovieDataStore.self) var movieDataStore
    @StateObject private var pathStore = PathStore()
    let director: Director
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            VStack {
                HStack {
                    Text("Director: " + director.firstName + " " + director.lastName)
                        .fontWeight(.bold)
                }
                Spacer()
                Divider()
                HStack {
                    Text("Movie(s)")
                        .fontWeight(.bold)
                    List(movieDataStore.getMovies(director: director), id: \.self){
                        movie in
                        NavigationLink(value: Route.movie(movie: movie)) {
                            VStack {
                                Text(movie.title)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                Spacer()
                Divider()
                HStack {
                    Text("Actors work with:")
                        .fontWeight(.bold)
                    List(movieDataStore.getActors(director: director), id: \.self){
                        actor in
                        NavigationLink(value: Route.actor(actor: actor)) {
                            VStack {
                                Text(actor.firstName + " " + actor.lastName)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                Spacer()
                Divider()
                HStack {
                    VStack {
                        
                    }
                }
            }
        }
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
