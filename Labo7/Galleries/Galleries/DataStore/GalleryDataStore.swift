//
//  GalleryDataStore.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import Foundation

@Observable
class GalleryDataStore {
    var galleries : [Gallery] = []

    func loadData() async {
        // TODO: Implement async loading
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            galleries = try load("galleries.json")
            sort()
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load galleries:", error)
            galleries = []
        }
    }
    
    private func sort() {
        self.galleries = Array(Set(self.galleries)).sorted {
            $0.id < $1.id
        }
    }
    
    func getArtists(gallery: Gallery) -> [Artist] {
        return gallery.artists
    }
    
    func getArtworks(artist: Artist) -> [Artwork] {
        return artist.artworks;
    }
}
