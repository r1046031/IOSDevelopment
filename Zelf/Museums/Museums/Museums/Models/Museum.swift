//
//  Museum.swift
//  Museums
//
//  Created by Dirk Hostens on 02/09/2024.
//

import Foundation

struct Museum: Identifiable, Codable, Hashable, Equatable {

    var id: String { museumID }

    var museumID: String
    var name: String?
    var city: String?
    var description: String?
    var exhibitions: [Exhibition]?

    enum CodingKeys: String, CodingKey {
        case museumID = "id"
        case name
        case city
        case description
        case exhibitions
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Museum, rhs: Museum) -> Bool {
        lhs.id.elementsEqual(rhs.id)
    }
}

struct MuseumResponse: Decodable {
    var museums: [Museum]
}
