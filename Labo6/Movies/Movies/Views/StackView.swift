//
//  StackView.swift
//  Movies
//
//  Created by Ilona Defevere on 03/12/2025.
//

import SwiftUI

struct StackView: View {
    @StateObject private var pathStore = PathStore()
    
    var body: some View {
        HStack {
            VStack {
                Text("Overview navigationStack")
                if(pathStore.path.contains(Route.movie)) {
                    Text("Movie ")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
