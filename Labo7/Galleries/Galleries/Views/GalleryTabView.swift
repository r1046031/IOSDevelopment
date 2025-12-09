//
//  GalleryTabView.swift
//  Galleries
//
//  Created by Ilona Defevere on 09/12/2025.
//

import SwiftUI

struct GalleryTabView: View {
    var body: some View {
        HStack {
            VStack {
                TabView {
                    Tab("Galleries", systemImage: "") {
                        GalleryListView()
                    }
                    Tab("No gallery", systemImage: "") {
                        GalleryDetailView()
                    }
                }
            }
        }
    }
}
