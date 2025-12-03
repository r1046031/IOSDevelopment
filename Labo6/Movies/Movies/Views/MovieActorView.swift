//
//  MovieActorView.swift
//  Movies
//
//  Created by Ilona Defevere on 19/11/2025.
//

import SwiftUI

struct MovieActorView: View {
    @Binding var selectedActor: Actor?
    
    var body: some View {
        if let selectedActor = selectedActor {
            VStack {
                HStack {
                    Text("Actor: " + selectedActor.firstName + " " + selectedActor.lastName)
                        .foregroundColor(.red)
                }
                Divider()
                HStack {
                    Text("Birthday" + "\(selectedActor.birthday)")
                }
                Spacer()
                Divider()
                HStack {
                    Text("Movie(s)")
                }
                Spacer()
                Divider()
                HStack {
                    Text("Overview navigationStack")
                    
                }
            }
            
        }
    }
}
