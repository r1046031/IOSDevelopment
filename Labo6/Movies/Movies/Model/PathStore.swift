//
//  PathStore.swift
//  Movies
//
//  Created by Ilona Defevere on 03/12/2025.
//

import Foundation
internal import Combine

final class PathStore: ObservableObject {
    @Published var path: [Route] = []
}
