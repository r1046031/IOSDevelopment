//
//  MovieDirectorView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieDirectorView: View {
    @Binding var selectedDirector: Director?
    
    var body: some View {
        if let selectedDirector = selectedDirector {
            VStack {
                HStack {
                    Text("Director: " + selectedDirector.firstName + " " + selectedDirector.lastName)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("Movie(s)")

                    Spacer()
                }
                Divider()
                HStack {
                    Text("Actors work with:")

                    Spacer()
                }
            }
        }
    }
}
