//
//  HomeView.swift
//  VivesUurrooster
//
//  Created by Ilona on 10/01/2026.
//

import SwiftUI

struct HomeView: View {
    @Environment(UurroosterDataStore.self) private var uurroosterDataStore
    @State private var loading = true
    @State var selectedItem: EventModel?
    
    var body: some View {
        NavigationSplitView {
            if loading {
                ProgressView("Loading")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                List(uurroosterDataStore.uurrooster, id: \.self, selection: $selectedItem) { item in
                    VStack {
                        Text("\(item.startDateTime)")
                            .fontWeight(.bold)
                        Text(item.title)
                    }
                }
            }
        } detail: {
            if let selectedItem = selectedItem {
                DetailView(selectedItem: $selectedItem)
            } else {
                Text("Selecteer event")
            }
        }
        .task {
            await uurroosterDataStore.loadData()
            loading = false
        }
        .toolbar {
            NavigationLink {
                AddModifyEventView()
            } label: {
                Text("...")
            }
        }
    }
}
