//
//  ArtistView.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct ArtistView: View {
    @Environment(DataManager.self) private var dataManager
    var artist: Artist
    
    var body: some View {
        HStack {
            VStack {
                Text(artist.name)
                Text(artist.nationality)
                Text(artist.style)
                Text(artist.description)
                Text("List of art")
                List(artist.artworks) { artwork in
                    VStack {
                        Text(artwork.title)
                        Text(artwork.description)
                    }
                    .onTapGesture {
                        dataManager.route.append(.artwork(artwork, artist))
                    }
                }
            }
        }
    }
}
