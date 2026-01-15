//
//  GalleryHomeView.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct GalleryHomeView: View {
    @Environment(DataManager.self) private var dataManager
    @State var loading = true
    @State var selectedGallery: Gallery?
    
    var body: some View {
        NavigationStack {
            if loading {
                ProgressView("Loading")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                List(dataManager.dataStore.galleries, id:\.self, selection: $selectedGallery) { gallery in
                    VStack {
                        Text(gallery.name)
                        Text(gallery.location)
                        Text(gallery.description)
                    }
                }
                
                if let selectedGallery = selectedGallery {
                    GalleryView(selectedGallery: $selectedGallery)
                }
            }
        }
        .task {
            await dataManager.dataStore.loadData()
            loading = false;
        }
    }
}
