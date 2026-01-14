//
//  CarDetailView.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct CarDetailView: View {
    @Environment(DataManager.self) private var dataManager
    var selectedCar: Car
    @State var favorite = dataManager.isInFavorites(car: $selectedCar)

    var body: some View {
        HStack {
            VStack {
                Text(selectedCar.brand)
                Text(selectedCar.model)
                Text(selectedCar.color)
                Text(selectedCar.fuelType)
                Text("\(selectedCar.year)")
                Text("\(selectedCar.price)")
                
                Button("Favoriet") {
                    favorite = !favorite
                    dataManager.addToFavorites(car: selectedCar)
                }
            }
            Image(systemName:"car")
        }
    }
}
