//
//  GalleryHomeView.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct GalleryHomeView: View {
    @Environment(DataManager.self) private var dataManager
    @State var loading = true
    
    var body: some View {
        NavigationStack {
            if loading {
                ProgressView("Loading")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                List(dataManager.dataStore.galleries, id:\.self) { gallery in
                    VStack(destination: gallery) {
                        NavigationLink(destination: gallery) {
                            VStack {
                                Text(gallery.name)
                                Text(gallery.location)
                                Text(gallery.description)
                            }
                        }
                    }
                }
            }
        }
        .navigationDestination(for: Destination.self) { destination in
            switch destination {
                case .artist(let artist):
                    ArtistView()
                case .artwork(let artwork):
                    ArtworkView()
                case .gallery(let gallery):
                    GalleryView()
            }
        }
        .task {
            await dataManager.dataStore.loadData()
            loading = false;
        }
    }
}
