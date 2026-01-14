//
//  GalleryDataStore.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

@Observable
class GalleryDataStore {
    var galleries : [Gallery] = []
    
    func sort() {
        galleries.sort { gallery1, gallery2 in
            gallery1.name > gallery2.name
        }
    }
    
    func loadData() async {
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            var response: GalleriesResponse = try load("galleries.json")
            galleries = response.galleries
            sort()
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load galleries:", error)
            galleries = []
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
           fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
