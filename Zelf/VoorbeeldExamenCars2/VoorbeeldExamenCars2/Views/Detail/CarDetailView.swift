//
//  CarDetailView.swift
//  VoorbeeldExamenCars2
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct CarDetailView: View {
    @Environment(DataManager.self) private var dataManager
    @State var favorite: Bool = false
    
    var body: some View {
        HStack {
            if let selectedCar = dataManager.selectedCar {
                VStack {
                    Text(dataManager.selectedCar!.brand)
                    Text(dataManager.selectedCar!.model)
                    Text(dataManager.selectedCar!.fuelType)
                    Text("\(dataManager.selectedCar!.price)")
                    Toggle("Add to favorites", isOn: $favorite)
                    Text("\(dataManager.selectedCar!.model) is \(favorite ? "in de favorieten" : "niet in de favorieten")")
                }
                Image(systemName:"car")
                
//                if(favorite) {
//                    dataManager.addToFavorites()
//                }
            }
        }
        .onAppear() {
            favorite = dataManager.isInFavorites()
        }
        .onChange(of: favorite) {
            if(favorite) {
                  dataManager.addToFavorites()
            } else {
                  dataManager.removeFromFavorites()
            }
        }
    }
}
