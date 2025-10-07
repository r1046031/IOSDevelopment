//
//  ContentView.swift
//  Labo2
//
//  Created by Ilona Defevere on 30/09/2025.
//

//alle views eindigen met .view

//tabs onderaan
//Tabview {
//  Tab("home", systemImage : "house) {
//      Homeview()
//  }
//}

import SwiftUI

struct ContentView: View {
    var body: some View {
        //VSTacks en Hstacks (andere layout van wereldbol en tekst)
        
        //library van elementen via view -> view library

        //.padding zodat het niet tegen de rand staat, gewoon laten
        var departureInfo = FlightInfo(departureCityCode: "BRU", departureCity: "Brussels", arrivalCityCode: "BCN", arrivalCity: "Barcelona", departureTime: "8:15", arrivalTime: "11:15", flightNumber: "SN23A", gateNumber: "B23", seatNumber: "27A", passengerName: "Dirk Hostens", passengerClass: "Business", flightDate: "27/03/2024")
        
        var arrivalInfo = FlightInfo(departureCityCode: "BCN", departureCity: "Barcelona", arrivalCityCode: "BRU", arrivalCity: "Brussels", departureTime: "8:15", arrivalTime: "15:15", flightNumber: "SN205", gateNumber: "XD-30", seatNumber: "17C", passengerName: "Dirk Hostens", passengerClass: "Business", flightDate: "01/04/2024")
        
        TabView {
          
            Tab("Departure", systemImage : "airplane.departure") {
                //hier dan een tupel maken met alle info die in de flightview moet
                //meegeven met flightview
                
                FlightView(flightinfo: departureInfo)
            }
            Tab("Info", systemImage : "info.bubble.fill") {
                HomeView()
            }
            Tab("Return", systemImage : "airplane.arrival") {
                FlightView(flightinfo: arrivalInfo)
            }
        }
    }
}

#Preview {
    ContentView()
}
