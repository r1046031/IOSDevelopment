//
//  UurroosterDetailView.swift
//  LoadAsync
//
//  Created by Ilona Defevere on 04/11/2025.
//

import SwiftUI

struct UurroosterDetailView: View {
    @Environment(UurroosterDataStore.self) var uurroosterDataStore
    @Binding var selectedAct: EventModel?
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "yy-MM-dd"
    }
    
    var body: some View {
        if let selectedAct = selectedAct {
            var selectedItemFromUurrooster = uurroosterDataStore.getEvent(id: "\(selectedAct.id)")
            VStack(alignment: .center) {
                VStack {
                    Text("\(selectedItemFromUurrooster.title)")
                    Text("\(selectedItemFromUurrooster.type)")
                }
                .foregroundStyle(Color.white)
                .background(Color.red)
                Divider()
                HStack {
                    VStack {
                        Text(selectedItemFromUurrooster.location)
                    }
                    Grid {
                        GridRow {
                            Text("Start")
                            Text("")
                            Text(dateFormatter.string(from: selectedAct.startDateTime))
                        }
                        GridRow {
                            Text("Einde")
                            Text("")
                            Text(dateFormatter.string(from: selectedAct.endDateTime))
                        }
                    }
                }
                Divider()
                HStack {
                    Text("&copy;")
                }
            }
            .padding()
        }
    }
}
