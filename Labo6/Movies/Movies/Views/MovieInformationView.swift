//
//  MovieInformationView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieInformationView: View {
    @Binding var selectedMovie: Movie?
    @State var selectedActor: Actor?
    
    var body: some View {
        if let selectedMovie = selectedMovie {
            VStack {
                VStack {
                    Text(selectedMovie.title)
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                    Text(selectedMovie.description)
                }
                Divider()
                Spacer()
                    HStack {
                        VStack {
                            Text("Actors")
                            List(selectedMovie.actors, id: \.self, selection: $selectedActor){
                                actor in
                                NavigationLink(destination: MovieActorView(selectedActor: $selectedActor)) {
                                    Text(actor.firstName + " " + actor.lastName)
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                
                Divider()
                HStack {
                    VStack {
                        Text("Director")
                        Text("\(selectedMovie.director.firstName)" + " " + "\(selectedMovie.director.lastName)")
                            .foregroundColor(.red)
                    }
                }
                Spacer()
                Divider()
                HStack {
                    //navigationstack moet hier
                }
            }
        }
    }
}
