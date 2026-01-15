//
//  MuseumView.swift
//  Museums
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct MuseumView: View {
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
        @Bindable var dataManager = dataManager
        
        NavigationStack(path: $dataManager.route) {
            VStack {
                if let selectedMuseum = dataManager.selectedMuseum {
                    Text(selectedMuseum.name!)
                    Text(selectedMuseum.description!)
                    Text(selectedMuseum.city!)
                    Text("Exhibitions")
                    if let exhibitions = selectedMuseum.exhibitions {
                        List(selectedMuseum.exhibitions!, id: \.self) { exhibition in
                            VStack {
                                Text(exhibition.title!)
                                Text(exhibition.description!)
                            }
                            .onTapGesture {
                                dataManager.route.append(.exhibition(exhibition))
                            }
                        }
                    }
                } else {
                    Text("Nog geen museum geselecteerd")
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                    case .artwork(let artwork):
                        ArtworkView(artwork: artwork)
                    case .exhibition(let exhibition):
                        ExhibitionView(exhibition: exhibition)
                }
            }
        }
        .onAppear() {
            dataManager.clearRoute()
        }
    }
}
