//
//  FlightView.swift
//  Labo2
//
//  Created by Ilona Defevere on 30/09/2025.
//

import SwiftUI

struct FlightView: View {
    let flightinfo: FlightInfo
    var body: some View {

        Grid {
            //hier de dingen die je van contentview wil gebruiken
            
            //de top: 3 gridrows
            //midden: twee gridrows
            //onderaan: 1 gridrow
            GridRow {
                HStack {
                    Text(flightinfo.departureCityCode)
                        .foregroundStyle(.accent)
                        .fontWeight(.bold)
                    Text("")
                    Text(flightinfo.arrivalCityCode)
                        .foregroundStyle(.accent)
                        .fontWeight(.bold)
                }
            }
            GridRow {
                HStack {
                    Text(flightinfo.departureCity)
                        .foregroundStyle(.gray)
                    Image(systemName: "airplane")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 50, alignment: .topLeading)
                    Text(flightinfo.arrivalCity)
                        .foregroundStyle(.gray)
                }
            }
            GridRow {
                HStack {
                    Text(flightinfo.departureTime)
                    Text("")
                    Text(flightinfo.arrivalTime)
                }
            }
        }
        Divider()
        
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
                    Text(flightinfo.flightNumber)
                    Text(flightinfo.gateNumber)
                    Text(flightinfo.seatNumber)
                }
            }
        }.padding()
            .foregroundStyle(.white)
            .background(.tint, in: RoundedRectangle(cornerRadius: 12))
        Divider()

        Grid {
            GridRow {
                VStack {
                    Text("Passenger")
                        .foregroundStyle(.gray)
                    Text(flightinfo.passengerName)
                    Text("Class")
                        .foregroundStyle(.gray)
                    Text(flightinfo.passengerClass)
                    Text("Flight date")
                        .foregroundStyle(.gray)
                    Text(flightinfo.flightDate)
                }
                
                //imageperson.crop.artframe
                Image(systemName: "person.crop.artframe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200, alignment: .topLeading)
            }
        }
        Divider()
        Spacer()
    }
}
