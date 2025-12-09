//
//  GalleryListView.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

struct GalleryListView: View {
    @Environment(GalleryDataStore.self) var galleryDataStore
    @State var selectedGallery: Gallery?
    @State var loading = true
    
    var body: some View {
        VStack {
            //GalleryTabView()
            if(!loading) {
                List(galleryDataStore.galleries, id: \.self, selection: $selectedGallery) { gallery in
                    VStack {
                        Text(gallery.name)
                        Text(gallery.location)
                        Text(gallery.description)
                    }
                }
            }
        }
        .task {
            await galleryDataStore.loadData()
            loading = false
        }
    }
}
