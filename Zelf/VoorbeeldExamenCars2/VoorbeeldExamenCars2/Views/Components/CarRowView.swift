//
//  CarRowView.swift
//  VoorbeeldExamenCars2
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

struct CarRowView: View {
    var car: Car
    
    var body: some View {
        HStack {
            VStack {
                Text(car.brand)
                Text(car.model)
                Text(car.fuelType)
                Text("\(car.price)")
            }
            Image(systemName:"car")
        }
    }
}
