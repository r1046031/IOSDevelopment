//
//  FlightView.swift
//  Labo2
//
//  Created by Ilona Defevere on 30/09/2025.
//

import SwiftUI

struct FlightView: View {
    var body: some View {
        Grid {
            //de top: 3 gridrows
            //midden: twee gridrows
            //onderaan: 1 gridrow
            GridRow {
                Text("BCN")
                Text("")
                Text("BRU")
            }
            GridRow {
                Text("Barcelona")
                Image("airplane")
                Text("Brussels")
            }
            GridRow {
                Text("13:08")
                Text("")
                Text("15:15")
            }
        }
        
        Grid {
            GridRow {
                Text("Flight")
                Text("Gate")
                Text("Seat")
            }
            GridRow {
                Text("5N23A")
                Text("XD-30")
                Text("17C")
            }
        }
        
        Grid {
            
        }
    }
}

#Preview {
    FlightView()
}
