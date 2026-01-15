//
//  ArtworkView.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct ArtworkView: View {
    @Environment(DataManager.self) private var dataManager
    var artwork: Artwork
    var artist: Artist
    
    var body: some View {
        HStack {
            VStack {
                Text(artwork.title)
                Text(artwork.medium)
                Text(artwork.dimensions)
                Text(artwork.description)
                Text("Artist " + artist.name)
                    .onTapGesture {
                        dataManager.route.append(.artist(artist))
                    }
                Text("List of other art")
                List(artist.artworks) { artwork in
                    if artwork.title != artwork.title {
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
}
