//
//  Exhibition.swift
//  Museums
//
//  Created by Dirk Hostens on 02/09/2024.
//

import Foundation

struct Exhibition: Identifiable, Codable, Hashable, Equatable {

    var id: String { exhibitionID }

    let exhibitionID: String
    let title: String?
    let period: String?
    let description: String?
    let artworks: [Artwork]

    enum CodingKeys: String, CodingKey {
        case exhibitionID = "id"
        case title
        case period
        case description
        case artworks
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Exhibition, rhs: Exhibition) -> Bool {
        lhs.id.elementsEqual(rhs.id)
    }
}
