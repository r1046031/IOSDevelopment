//
//  ContentView.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                Tab("Galleries", systemImage: "") {
                    GalleryHomeView()
                }
                Tab("No gallery selected", systemImage: "") {
                    GalleryView(selectedGallery: nil)
                }
            }
        }
    }

