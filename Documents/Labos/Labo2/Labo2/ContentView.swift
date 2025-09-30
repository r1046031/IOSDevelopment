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
        
        
        TabView {
          
            Tab("Departure", systemImage : "airplane.departure") {
                FlightView()
            }
            Tab("Info", systemImage : "info.bubble.fill") {
                HomeView()
            }
            Tab("Return", systemImage : "airplane.arrival") {
                FlightView()
            }
        }
    }
}

#Preview {
    ContentView()
}
