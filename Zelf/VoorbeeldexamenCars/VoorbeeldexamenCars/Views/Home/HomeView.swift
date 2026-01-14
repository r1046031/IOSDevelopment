//
//  HomeView.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataManager.self) private var dataManager

    var body: some View {
        VStack {
            SettingsView()
            VStack {
                NavigationStack {
                    List(dataManager.cars) { car in
                        NavigationLink(value: car) {
                            CarView(car: car)
                        }
                    }
                    .navigationTitle("Auto’s")
                    .navigationDestination(for: Car.self) { car in
                        CarDetailView(selectedCar: car, dataManager: dataManager)
                    }
                }
                .onAppear {
                    dataManager.filter()
                }
                .onChange(of: dataManager.selectedFilter) {
                    dataManager.filter()
                }
            }
        }
    }
}

