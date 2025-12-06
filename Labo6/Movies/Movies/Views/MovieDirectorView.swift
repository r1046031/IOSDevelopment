//
//  MovieDirectorView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieDirectorView: View {
    @Environment(MovieDataStore.self) var movieDataStore
    @EnvironmentObject var pathStore: PathStore
    let director: Director
    
    var body: some View {
            VStack {
                HStack {
                    Text("Director: " + director.firstName + " " + director.lastName)
                        .fontWeight(.bold)
                }
                Spacer()
                Divider()
                HStack {
                    VStack {
                        Text("Movie(s)")
                            .fontWeight(.bold)
                        List(movieDataStore.getMovies(director: director), id: \.self){
                            movie in
                            NavigationLink(value: Route.movie(movie: movie)) {
                                VStack {
                                    Text(movie.title)
                                        .foregroundColor(.red)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        .listStyle(.plain)
                        .listRowSeparator(.hidden)
                    }
                }
                Spacer()
                Divider()
                HStack {
                    VStack {
                        Text("Actors work with:")
                            .fontWeight(.bold)
                        List(movieDataStore.getActors(director: director), id: \.self){
                            actor in
                            NavigationLink(value: Route.actor(actor: actor)) {
                                VStack {
                                    Text(actor.firstName + " " + actor.lastName)
                                        .foregroundColor(.red)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .listStyle(.plain)
                            .listRowSeparator(.hidden)
                        }
                    }
                }
                Spacer()
                Divider()
                HStack {
                    VStack {
                        StackView()
                    }
                }
            }
        }
}
