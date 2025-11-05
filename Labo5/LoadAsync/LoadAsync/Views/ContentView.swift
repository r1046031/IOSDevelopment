//
//  ContentView.swift
//  LoadAsync
//
//  Created by Ilona Defevere on 04/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack() {
            NavigationSplitView {
                UurroosterDetailView()
            } detail: {
                AddModifyEventView()
            }
        }
    }
}
