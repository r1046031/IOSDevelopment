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
//        var flightInfo = (departureCity, arrivalCity, departureTime, arrivalTime, flightNumber, gateNumber)
//        var passengerInfo = (name, class, seatNumber)
        
        
        TabView {
          
            Tab("Departure", systemImage : "airplane.departure") {
                //hier dan een tupel maken met alle info die in de flightview moet
                //meegeven met flightview
                var flightInfo = (departureCity: "Brussels", arrivalCity: "Barcelona", departureTime: "8:15", arrivalTime: "11:15", flightNumber: "SN23A", gateNumber: "B23")
                var passengerInfo = (name: "Dirk Hostens", class: "Business", seatNumber: "27A")
                
                FlightView()
            }
            Tab("Info", systemImage : "info.bubble.fill") {
                HomeView()
            }
            Tab("Return", systemImage : "airplane.arrival") {
                var flightInfo = (departureCity: "Barcelona", arrivalCity: "Brussels", departureTime: "13:05", arrivalTime: "15:15", flightNumber: "SN205", gateNumber: "XD-30")
                var passengerInfo = (name: "Dirk Hostens", class: "Business", seatNumber: "17C")
                
                FlightView()
            }
        }
    }
}

#Preview {
    ContentView()
}
