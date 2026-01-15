//
//  DataStore.swift
//  VoorbeeldExamenCars2
//
//  Created by Ilona Defevere on 15/01/2026.
//

import SwiftUI

@Observable
class DataStore {
    var cars: [Car] = []
    
    func sortByPrice() {
        cars = cars.sorted { $0.price > $1.price }
    }
    
    func sortByBrand() {
        cars = cars.sorted { $0.brand < $1.brand }
    }
    
    func sortByYear() {
        cars = cars.sorted { $0.year > $1.year }
    }
     
    func loadCars() async {
        do {
            print("⏳ Loading car data...")
            try await Task.sleep(for: .seconds(1))
            var response: CarsResponse = try load("cars.json")
            cars = response.cars
            sortByPrice()
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
