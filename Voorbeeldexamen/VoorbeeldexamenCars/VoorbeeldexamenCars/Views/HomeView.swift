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
                            NavigationLink(destination: CarView()) {
                                GridRow {
                                    Text(car.brand)
                                    Text(car.model)
                                    Text("\(car.price)")
                                    
                                }
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
