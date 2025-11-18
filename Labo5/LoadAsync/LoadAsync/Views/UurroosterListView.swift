//
//  UurroosterListView.swift
//  LoadAsync
//
//  Created by Ilona Defevere on 05/11/2025.
//

import SwiftUI
import Foundation

struct UurroosterListView: View {
    @Environment(UurroosterDataStore.self) var uurroosterDataStore
    @State var selectedAct: EventModel?
    @State var loading = true
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "yy-MM-dd"
    }
    
    var body: some View {
        HStack() {
            NavigationSplitView {
                if loading == true {
                    Text("loading")
                } else {
                    VStack(alignment: .leading) {
                        List(uurroosterDataStore.uurrooster, id: \.self, selection: $selectedAct) { item in
                            VStack {
                                Text(dateFormatter.string(from: item.startDateTime))
                                    .multilineTextAlignment(.leading)
                                Text("\(item.title)")
                            }
                        }
                    }
                }
            } detail: {
                if let selectedAct = selectedAct {
                    UurroosterDetailView(selectedAct: $selectedAct)
                } else {
                    Text("Selecteer event")
                }
            }
            .task {
                await uurroosterDataStore.loadData()
                loading = false
            }
        }
    }
}
