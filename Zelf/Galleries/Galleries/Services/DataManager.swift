//
//  DataManager.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

@Observable
class DataManager {
    var dataStore = GalleryDataStore()
    var selectedGallery: Gallery? = nil
    var route: [Destination] = []
    
    func clearRoute() {
        route = []
    }
}

enum Destination: Hashable {
    case artist(Artist)
    case artwork(Artwork, Artist)
}
