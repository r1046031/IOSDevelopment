//
//  DetailView.swift
//  VivesUurrooster
//
//  Created by Ilona on 13/01/2026.
//

import SwiftUI

struct DetailView: View {
    @Binding var selectedItem: EventModel?
    
    var body: some View {
        if let selectedItem = selectedItem {
            VStack {
                Spacer()
                Text(selectedItem.title)
                    .background(Color.red)
                    .foregroundStyle(Color.white)
                Divider()
                Grid {
                    GridRow {
                        Text(selectedItem.location)
                        Text("")
                        Text("")
                    }
                    GridRow {
                        Text("Start")
                        Text("")
                        Text("\(selectedItem.startDateTime)")
                    }
                    GridRow {
                        Text("Einde")
                        Text("")
                        Text("\(selectedItem.endDateTime)")
                    }
                }
                Divider()
                Text("copy")
                Spacer()
            }
            Spacer()
        }
    }
}
