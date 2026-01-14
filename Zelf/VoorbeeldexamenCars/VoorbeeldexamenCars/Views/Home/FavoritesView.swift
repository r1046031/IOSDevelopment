//
//  FavoritesView.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(DataManager.self) private var dataManager

    var body: some View {
        NavigationStack {
            if(dataManager.favorites.isEmpty) {
                Text("Er is nog niets toegevoegd aan je favorieten")
            } else {
                List(dataManager.favorites) { car in
                    NavigationLink(value: car) {
                        CarView(car: car)
                    }
                }
                .navigationTitle("Auto’s")
                .navigationDestination(for: Car.self) { car in
                    CarDetailView(selectedCar: car, dataManager: dataManager)
                }
            }
        }
    }
}
