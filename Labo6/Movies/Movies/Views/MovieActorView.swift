//
//  MovieActorView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieActorView: View {
    let actor: Actor
    @Environment(MovieDataStore.self) var movieDataStore
    @StateObject private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            VStack {
                HStack {
                    Text("Actor: " + actor.firstName + " " + actor.lastName)
                        .foregroundColor(.red)
                }
                Divider()
                HStack {
                    Text("Birthday" + "\(actor.birthday)")
                }
                Spacer()
                Divider()
                HStack {
                    VStack {
                        Text("Movie(s)")
                            .fontWeight(.bold)
                        List(movieDataStore.getMovies(actor: actor), id: \.self){
                            movie in
                            NavigationLink(value: Route.movie(movie: movie)) {
                                VStack {
                                    Text(movie.title)
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
                Spacer()
                Divider()
                HStack {
                    
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
