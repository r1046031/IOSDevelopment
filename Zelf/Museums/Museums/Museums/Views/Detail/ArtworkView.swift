//
//  ArtworkView.swift
//  Museums
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct ArtworkView: View {
    var artwork: Artwork
    
    var body: some View {
        VStack {
            Text(artwork.title)
            Text(artwork.medium)
            Text(artwork.dimensions)
            Text("\(artwork.year)")
            Text(artwork.artist)
        }
    }
}
