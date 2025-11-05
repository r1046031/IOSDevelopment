//
//  UurroosterListView.swift
//  LoadAsync
//
//  Created by Ilona Defevere on 05/11/2025.
//

import SwiftUI

struct UurroosterListView: View {
    @Environment(UurroosterDataStore.self) var uurroosterDataStore
    @State var selectedItem: String?
    
    var body: some View {
        HStack() {
            NavigationSplitView {
                VStack {
                    List(uurroosterDataStore.uurrooster, selection: $selectedItem) { item in
                        NavigationLink(destination: AddModifyEventView(selectedItem: item.id)) {
                            VStack {
                                Text(uurroosterDataStore.uurrooster.startDateTime)
                                    .fontWeight(.bold)
                                Text(uurroosterDataStore.uurrooster.title)
                            }
                        }
                    }
                }
            } detail: {
                UurroosterDetailView(selectedItem: $selectedItem).task(wait)
            }
        }
    }
}
