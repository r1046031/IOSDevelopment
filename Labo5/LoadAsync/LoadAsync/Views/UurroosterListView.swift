//
//  UurroosterListView.swift
//  LoadAsync
//
//  Created by Ilona Defevere on 05/11/2025.
//

import SwiftUI

struct UurroosterListView: View {
    @Environment(UurroosterDataStore.self) var uurroosterDataStore
    @State var selectedAct: EventModel?
    
    var body: some View {
        HStack() {
            NavigationSplitView {
                VStack {
                    List(uurroosterDataStore.uurrooster, selection: $selectedAct) { item in
                        VStack {
                            Text("\(item.startDateTime)")
                            Text(item.title)
                        }
                    }
                }
            } detail: {
                if let selectedAct = selectedAct {
                    UurroosterDetailView(selectedAct: $selectedAct)
                }
            }
        }
    }
}
