//
//  ArtworkDetailView.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

struct ArtworkDetailView: View {
    @Environment(GalleryDataStore.self) var galleryDataStore
    @Binding var selectedArtwork: Artwork?
    @Binding var selectedArtist: Artist?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let selectedArtwork = selectedArtwork, let selectedArtist = selectedArtist {
                    HStack {
                        Text(selectedArtwork.title)
                            .foregroundColor(.brown)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                    }
                    Divider()
                    HStack {
                        VStack {
                            Text(selectedArtwork.medium)
                            Text(selectedArtwork.dimensions)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                    Text("artist: " + selectedArtist.name)
                        .foregroundColor(.brown)
                    Divider()
                    HStack {
                        VStack {
                            Text("List of other art")
                            List(galleryDataStore.getArtworks(artist: selectedArtist), id: \.self, selection: $selectedArtwork) {
                                artwork in
                                //todo: controleren of het artwork het artwork is dat geselecteerd is
                                NavigationLink(destination: ArtworkDetailView(selectedArtwork: $selectedArtwork, selectedArtist: $selectedArtist)) {
                                    VStack {
                                        Text(artwork.title)
                                            .foregroundColor(.brown)
                                            .fontWeight(.bold)
                                        Text(artwork.description)
                                            .foregroundColor(.gray)
                                    }
                                    Divider()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
