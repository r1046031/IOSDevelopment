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
    @EnvironmentObject var pathStore: PathStore
    
    var body: some View {
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
                    StackView()
                }
            }
        }
}
