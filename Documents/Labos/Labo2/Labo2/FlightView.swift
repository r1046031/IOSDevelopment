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
            //hier de dingen die je van contentview wil gebruiken
            
            //de top: 3 gridrows
            //midden: twee gridrows
            //onderaan: 1 gridrow
            GridRow {
                HStack {
                    Text("BCN")
                        .foregroundStyle(.green)
                    Text("")
                    Text("BRU")
                        .foregroundStyle(.green)
                }
            }
            GridRow {
                HSTack {
                    Text("Barcelona")
                    Image(systemName: "airplane")
                    Text("Brussels")
                }
            }
            GridRow {
                Hstack {
                    Text("13:08")
                    Text("")
                    Text("15:15")
                }
            }
        }
        
        Grid {
            GridRow {
                HStack {
                    Text("Flight")
                    Text("Gate")
                    Text("Seat")
                }
            }
            GridRow {
                HStack {
                    Text("5N23A")
                    Text("XD-30")
                    Text("17C")
                }
            }
        }
        
        Grid {
            GridRow {
                VStack {
                    Text("Passenger")
                    Text("Drik Honstens")
                    Text("Class")
                    Text("Business")
                    Text("Flight date")
                    Text("1/09/2024")
                }
                
                //imageperson.crop.artframe
                Image(systemName: "person.crop.artframe")
            }
        }
    }
}

#Preview {
    FlightView()
}
