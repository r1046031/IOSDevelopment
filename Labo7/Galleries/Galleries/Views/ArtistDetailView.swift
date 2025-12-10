//
//  ArtistDetailView.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

struct ArtistDetailView: View {
    @Environment(GalleryDataStore.self) var galleryDataStore
    @Binding var selectedArtist: Artist?
    @State var selectedArtwork: Artwork?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let selectedArtist = selectedArtist {
                    HStack {
                        Text(selectedArtist.name)
                            .foregroundColor(.brown)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                    }
                    Divider()
                    HStack {
                        VStack {
                            Text(selectedArtist.nationality)
                            Text(selectedArtist.style)
                                .fontWeight(.bold)
                            Text(selectedArtist.description)
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                    HStack {
                        VStack {
                            Text("List of art")
                                .foregroundColor(.brown)
                            
                            List(galleryDataStore.getArtworks(artist: selectedArtist), id: \.self, selection: $selectedArtwork) {
                                artwork in
                                NavigationLink(destination: ArtworkDetailView(selectedArtwork: $selectedArtwork)) {
                                    VStack {
                                        Text(artwork.title)
                                            .foregroundColor(.brown)
                                        Text(artwork.description)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
