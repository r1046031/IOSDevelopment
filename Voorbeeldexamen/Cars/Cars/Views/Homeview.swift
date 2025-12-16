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
        //@Bindable var dataManager.selectedFilter = dataManager.selectedFilter
        
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
                                    //tot hier aan gekomen
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
