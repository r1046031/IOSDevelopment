//
//  CarView.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 14/01/2026.
//

import SwiftUI

struct CarView: View {
    var car: Car
    
    var body: some View {
        HStack {
            VStack {
                Text(car.brand)
                Text(car.model)
                Text(car.fuelType)
            }
            Image(systemName:"car")
        }
    }
}
