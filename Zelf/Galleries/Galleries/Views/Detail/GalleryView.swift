//
//  GalleryView.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct GalleryView: View {
    @Environment(DataManager.self) private var dataManager
    @Binding var selectedGallery: Gallery?
    
    var body: some View {
        VStack {
            if let selectedGallery = selectedGallery {
                Text(selectedGallery.name)
                Text(selectedGallery.location)
                Text(selectedGallery.description)
                Text("List of artists")
            }
        }
    }
}
