//
//  Artwork.swift
//  Museums
//
//  Created by Dirk Hostens on 02/09/2024.
//

import Foundation

struct Artwork: Identifiable, Codable, Hashable, Equatable {

    var id: String { artworkID }

    let artworkID: String
    let title: String?
    let artist: String?
    let year: Int?
    let medium: String?
    let dimensions: String?

    enum CodingKeys: String, CodingKey {
        case artworkID = "id"
        case title
        case artist
        case year
        case medium
        case dimensions
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Artwork, rhs: Artwork) -> Bool {
        lhs.id.elementsEqual(rhs.id)
    }
}

