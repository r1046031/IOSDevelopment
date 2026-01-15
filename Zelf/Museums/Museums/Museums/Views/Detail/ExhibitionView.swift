//
//  ExhibitionView.swift
//  Museums
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct ExhibitionView: View {
    @Environment(DataManager.self) private var dataManager
    var exhibition: Exhibition
    
    var body: some View {
        @Bindable var dataManager = dataManager
        
        VStack {
            Text(exhibition.title)
            Text(exhibition.description)
            Text("Artworks")
            List(exhibition.artworks, id: \.self) { artwork in
                VStack {
                    Text(artwork.title)
                    Text(artwork.artist)
                }
                .onTapGesture {
                    dataManager.route.append(.artwork(artwork))
                }
            }
        }
    }
}
