//
//  MovieInformationView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieInformationView: View {
    let movie: Movie
    @EnvironmentObject var pathStore: PathStore
    
    var body: some View {
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
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
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
                StackView()
            }
        }
    }
}
