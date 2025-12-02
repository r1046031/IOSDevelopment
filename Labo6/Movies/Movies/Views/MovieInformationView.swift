//
//  MovieInformationView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieInformationView: View {
    @Binding var selectedMovie: Movie?
    @State var selectedDirector: Director?
    @State var selectedActor: Actor?
    
    var body: some View {
        if let selectedMovie = selectedMovie {
            VStack {
                HStack {
                    Text(selectedMovie.title)
                    Text(selectedMovie.description)
                }
                Divider()
                HStack {
                    VStack {
                        Text("Actors")
                        List(selectedMovie.actors, id: \.self, selection: $selectedActor){
                            actor in
                            NavigationLink(destination: MovieActorView()) {
                                VStack {
                                    Text(actor.firstName + " " + actor.lastName)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                Divider()
                HStack {
                    VStack {
                        Text("Director")
                        Text("\(selectedMovie.director.firstName)" + " " + "\(selectedMovie.director.lastName)")
                    }
                    Spacer()
                }
                Divider()
                HStack {
                    VStack {
                        Text("Overview navigationStack")
                        Text("Movie " + selectedMovie.title)
                        //button
                    }
                }
            }
        }
    }
}
