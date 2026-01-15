//
//  GalleryView.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct GalleryView: View {
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
        @Bindable var dataManager = dataManager
        
        NavigationStack(path: $dataManager.route) {
            VStack {
                if let selectedGallery = dataManager.selectedGallery {
                    Text(dataManager.selectedGallery!.name)
                    Text(dataManager.selectedGallery!.location)
                    Text(dataManager.selectedGallery!.description)
                    Text("List of artists")
                    List(dataManager.selectedGallery!.artists) { artist in
                        VStack {
                            Text(artist.name)
                            Text(artist.nationality)
                        }
                        .onTapGesture {
                            dataManager.route.append(.artist(artist))
                        }
                    }
                } else {
                    Text("no gallery selected")
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                    case .artist(let artist):
                        ArtistView(artist: artist)
                    case .artwork(let artwork, let artist):
                        ArtworkView(artwork: artwork, artist: artist)
                }
            }
        }
        .onAppear {
            dataManager.clearRoute()
        }
    }
}
