//
//  CarHomeView.swift
//  VoorbeeldExamenCars2
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct CarHomeView: View {
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
        @Bindable var dataManager = dataManager
        
        NavigationStack {
            List(dataManager.dataStore.cars, id: \.self, selection: $dataManager.selectedCar) { car in
                NavigationLink(value: car) {
                    CarRowView(car: car)
                }
            }
            .navigationDestination(for: Car.self) { car in
                CarDetailView()
            }
        }
        .onAppear() {
            dataManager.sort()
        }
    }
}
