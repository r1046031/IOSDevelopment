//
//  FavoritesView.swift
//  VoorbeeldExamenCars2
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
        @Bindable var dataManager = dataManager
        
        NavigationStack {
            VStack {
                if dataManager.favorites != [] {
                    List(dataManager.favorites, id: \.self, selection: $dataManager.selectedCar) { car in
                        NavigationLink(value: car) {
                            CarRowView(car: car)
                        }
                    }
                } else {
                    Text("Er zijn nog geen favorieten geselecteerd")
                }
            }
            .navigationDestination(for: Car.self) { car in
                CarDetailView()
            }
        }
    }
}
