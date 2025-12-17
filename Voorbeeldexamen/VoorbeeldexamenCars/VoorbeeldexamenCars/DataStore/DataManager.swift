//
//  DataManager.swift
//  VoorbeeldexamenCars
//
//  Created by Ilona Defevere on 17/12/2025.
//

import Foundation
import SwiftUI

@Observable
class DataManager {
    var cars: [Car] = []

    var path: Path?
    var filterTypes = ["Alle", "Benzine", "Elektrisch"]
    var selectedFilter : String = "Alle"
    var favorites : [Car]?
    var loading = true
    
    func sort() {
        cars.sort { car1, car2 in
            car1.id > car2.id
        }
    }
    
    func getCarsWithFuel(filter: String) -> [Car] {
        //filter
        let carsWithFuel: [Car] = cars.filter {
            $0.fuelType == filter
        }
        
        return carsWithFuel
    }
    
    func loadCars() async {
        do {
            print("⏳ Loading car data...")
            try await Task.sleep(for: .seconds(1))
            
            let response: CarsResponse = load("cars.json")
            self.cars = response.cars
            
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load cars:", error)
        }
        
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
