//
//  GalleryListView.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

struct GalleryListView: View {
    @Environment(GalleryDataStore.self) var galleryDataStore
    @Binding var selectedGallery: Gallery?
    @State var loading = true
    
    var body: some View {
        VStack {
            if(loading) {
                Text("loading")
            } else {
                List(galleryDataStore.galleries, id: \.self, selection: $selectedGallery) { gallery in
                    VStack {
                        Text(gallery.name)
                            .foregroundColor(.brown)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        Text(gallery.location)
                            .fontWeight(.bold)
                        Text(gallery.description)
                            .foregroundColor(.gray)
                        Divider()
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
