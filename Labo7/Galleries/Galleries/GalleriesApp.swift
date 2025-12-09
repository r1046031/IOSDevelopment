//
//  GalleriesApp.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

@main
struct GalleriesApp: App {
    @State var galleryDataStore = GalleryDataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(galleryDataStore)
        }
    }
}
