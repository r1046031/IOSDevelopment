//
//  GalleryDetailView.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

struct GalleryDetailView: View {
    @Environment(GalleryDataStore.self) var galleryDataStore
    @Binding var selectedGallery: Gallery?
    @State var selectedArtist: Artist?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let selectedGallery = selectedGallery {
                    HStack {
                        Text(selectedGallery.name)
                            .foregroundColor(.brown)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                    }
                    Divider()
                    HStack {
                        VStack {
                            Text(selectedGallery.location)
                                .fontWeight(.bold)
                            Text(selectedGallery.description)
                        }
                    }
                    Divider()
                    HStack {
                        VStack {
                            Text("List of artists")
                                .foregroundColor(.brown)
                        }
                    }
                    List(galleryDataStore.getArtists(gallery: selectedGallery), id: \.self, selection: $selectedArtist) {
                        artist in
                        NavigationLink(destination: ArtistDetailView(selectedArtist: $selectedArtist)) {
                            VStack {
                                Text(artist.name)
                                    .foregroundColor(.brown)
                                Text(artist.nationality)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                } else {
                    Text("No gallery selected")
                }
            }
        }
    }
}
