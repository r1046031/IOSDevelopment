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
                Text("Actor: " + selectedActor.firstName + " " + selectedActor.lastName)
            }
            Divider()
        }
    }
}
