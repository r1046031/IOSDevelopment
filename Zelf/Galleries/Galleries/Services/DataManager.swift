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
    var route: [Destination] = []
}

enum Destination: Hashable {
    case gallery(Gallery)
    case artist(Artist)
    case artwork(Artwork)
}
