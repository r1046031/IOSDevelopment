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
    
    var body: some View {
        @Bindable var dataManager = dataManager
        
        VStack {
            if loading {
                ProgressView("Loading")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                List(dataManager.dataStore.galleries, id:\.self, selection: $dataManager.selectedGallery) { gallery in
                    VStack {
                        Text(gallery.name)
                        Text(gallery.location)
                        Text(gallery.description)
                    }
                }
            }
        }
        .task {
            await dataManager.dataStore.loadData()
            loading = false;
        }
    }
}
