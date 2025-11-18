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
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yy-MM-dd"
        return df
    }()
    
    var body: some View {
        if let selectedAct = selectedAct {
            var selectedItemFromUurrooster = uurroosterDataStore.getEvent(id: "\(selectedAct.id)")
            VStack(alignment: .center) {
                VStack {
                    Text("\(selectedItemFromUurrooster.title)")
                }
                .foregroundStyle(Color.white)
                .background(Color.red)
                Divider()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(selectedItemFromUurrooster.location)
                    }
                    Grid(alignment: .center) {
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
