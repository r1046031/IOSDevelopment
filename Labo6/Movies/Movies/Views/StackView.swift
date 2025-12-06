//
//  StackView.swift
//  Movies
//
//  Created by Ilona Defevere on 03/12/2025.
//

import SwiftUI

struct StackView: View {
    @EnvironmentObject var pathStore: PathStore
    
    var currentMovie: Movie? {
        pathStore.path.compactMap { route in
            if case let .movie(movie) = route {
                return movie
            }
            return nil
        }.last
    }
    
    var currentActor: Actor? {
        pathStore.path.compactMap { route in
            if case let .actor(actor) = route {
                return actor
            }
            return nil
        }.last
    }
    
    var currentDirector: Director? {
        pathStore.path.compactMap { route in
            if case let .director(director) = route {
                return director
            }
            return nil
        }.last
    }
    
    var body: some View {
        VStack {
            Text("Overview navigationStack")
            
            if let movie = currentMovie {
                Text("Movie \(movie.title)")
                    .foregroundColor(.blue)
            }
            
            if let actor = currentActor {
                Text("Actor \(actor.firstName) \(actor.lastName)")
                    .foregroundColor(.gray)
            }
            
            if let director = currentDirector {
                Text("Director \(director.firstName) \(director.lastName)")
            }
            
            Button("Clear") {
                pathStore.path = []
                MovieListView()
            }
        }
    }
}
