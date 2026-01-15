//
//  DataManager.swift
//  Museums
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

@Observable
class DataManager {
    var dataStore = DataStore()
    var selectedMuseum: Museum?
    var route: [Destination] = []
    
    func clearRoute() {
        route = []
    }
}

enum Destination: Hashable {
    case artwork(Artwork)
    case exhibition(Exhibition)
}
