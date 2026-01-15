//
//  DataStore.swift
//  Museums
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

@Observable
class DataStore {
    var museums: [Museum] = []
    
    func loadData() async {
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2))
            var response: MuseumResponse = try load("museums")
            museums = response.museums.map { museum in
                var fixed = museum
                fixed.museumID = museum.museumID ?? ""
                fixed.city = museum.city ?? ""
                fixed.description = museum.description ?? ""
                fixed.exhibitions = museum.exhibitions ?? []
            }
            museums = response.museums
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load galleries:", error)
            museums = []
        }
    }
}

func load<T: Decodable>(_ filename: String) throws -> T {
    // 1. Find the file in the app bundle
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        throw DataLoadError.fileNotFound(filename)
    }

    // 2. Load the file contents as Data
    let data = try Data(contentsOf: url)

    // 3. Create a decoder
    let decoder = JSONDecoder()

    // 4. Decode and return - T is inferred from usage
    return try decoder.decode(T.self, from: data)
}

// Custom error for better error messages
enum DataLoadError: LocalizedError {
    case fileNotFound(String)

    var errorDescription: String? {
        switch self {
        case .fileNotFound(let filename):
            return "Could not find \(filename).json in app bundle"
        }
    }
}
