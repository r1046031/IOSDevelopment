//
//  ContentView.swift
//  Galleries
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
            TabView {
                Tab("Galleries", systemImage: "") {
                    GalleryHomeView()
                }
                Tab("Gallery", systemImage: "") {
                    GalleryView()
                }
            }
        }
    }

