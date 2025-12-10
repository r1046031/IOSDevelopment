//
//  ContentView.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State var selectedGallery: Gallery? = nil
    
    var body: some View {
        GalleryTabView(selectedGallery: $selectedGallery)
    }
}
