//
//  Route.swift
//  Movies
//
//  Created by Ilona Defevere on 03/12/2025.
//

enum Route: Hashable {
    case movie(movie: Movie)
    case actor(actor: Actor)
    case director(director: Director)
}
