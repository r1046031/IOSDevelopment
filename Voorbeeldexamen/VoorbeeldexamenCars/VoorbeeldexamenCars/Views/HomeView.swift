//
//  CarListViewAll.swift
//  Cars
//
//  Created by Ilona Defevere on 16/12/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataManager.self) private var dataManager
    
    var body: some View {
        @Bindable var dataManager = dataManager
        
        NavigationStack {
            if(dataManager.loading) {
                ProgressView("Loading Courses...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                VStack {
                    Grid {
                        ForEach(dataManager.cars, id: \.self) { car in
                            NavigationLink(value: Destination.CarDetail(car)) {
                                GridRow {
                                    HStack {
                                        VStack {
                                            Text(car.brand)
                                                .fontWeight(.bold)
                                            Text(car.model)
                                                .foregroundColor(.blue)
                                            Text("\(String(car.price))")
                                        }
                                        .font(.system(size: 16))
                                        Image(systemName: "car.fill")
                                    }
                                }
                            }
                        }
                        .navigationDestination(for: Destination.self) { destination in
                            switch destination {
                            case .CarsList(let cars):
                                HomeView()

                            case .CarDetail(let car):
                                CarView()
                            }
                        }
                    }
                }
            }
        }
        .task {
            await dataManager.loadCars()
            dataManager.loading = false
        }
    }
}
