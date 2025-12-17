//
//  CarView.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 17/12/2025.
//

import SwiftUI

struct CarView: View {
    let car: Car
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Text(car.brand)
                        .font(.system(size: 24))
                    Text(car.model)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                    Text(car.fuelType)
                        .foregroundColor(.blue)
                    Divider()
                    Text("\(String(car.year))")
                    Text(car.color)
                    Text("\(String(car.price))")
                }
            }
        }
    }
}
