//
//  MovieInformationView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieInformationView: View {
    let movie: Movie
    @StateObject private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            VStack {
                VStack {
                    Text(movie.title)
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                    Text(movie.description)
                }
                Divider()
                Spacer()
                HStack {
                    VStack {
                        Text("Actors")
                            List(movie.actors, id: \.self){
                                actor in
                                NavigationLink(value: Route.actor(actor: actor)) {
                                    VStack {
                                        Text(actor.firstName + " " + actor.lastName)
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                        }
                    }
                    Divider()
                    HStack {
                        VStack {
                            Text("Director")
                            NavigationLink(value: Route.director(director: movie.director)) {
                                Text("\(movie.director.firstName)" + " " + "\(movie.director.lastName)")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    Spacer()
                    Divider()
                    HStack {
                        //navigationstack moet hier
                    }
                }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case let .actor(actor):
                    MovieActorView(actor: actor)
                case let .director(director: director):
                    MovieDirectorView(director: director)
                case let .movie(movie: movie):
                    MovieInformationView(movie: movie)
                }
            }
        }
    }
}
