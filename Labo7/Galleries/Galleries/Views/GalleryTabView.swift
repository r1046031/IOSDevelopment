//
//  GalleryTabView.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

struct GalleryTabView: View {
    @Binding var selectedGallery: Gallery?
    
    var body: some View {
        TabView() {
            GalleryListView(selectedGallery: $selectedGallery)
                .tabItem {
                    Label("Galleries", systemImage: "photo.on.rectangle")
                }
            
            GalleryDetailView(selectedGallery: $selectedGallery)
                .tabItem {
                    Label(selectedGallery?.name ?? "No gallery",
                          systemImage: "photo.on.rectangle")
                }

        }
    }
}
