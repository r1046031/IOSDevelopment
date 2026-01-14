import Foundation
import SwiftUI

@Observable
class DataManager {
    var cars: [Car] = []
    var selectedCar: Car?
    var favorites: [Car] = []
    var path = [Destination]()
    var selectedFilter: Filter?
    
    func setFilter(newFilter: Filter) {
        selectedFilter = newFilter
        filter()
    }
    
    func filter() {
        if(selectedFilter == Filter.prijs) {
            sortByPrice()
        }
        
        if(selectedFilter == Filter.merk) {
            sortByBrand()
        }
        
        if(selectedFilter == Filter.jaar) {
            sortByYear()
        }
    }
    
    private func sortByPrice() {
        cars.sort { car1, car2 in
            car1.price > car2.price
        }
    }
    
    private func sortByBrand() {
        cars.sort { car1, car2 in
            car1.brand > car2.brand
        }
    }
    
    private func sortByYear() {
        cars.sort { car1, car2 in
            car1.year > car2.year
        }
    }
    
    func addToFavorites(car: Car) {
        favorites.append(car)
    }
    
    func removeFromFavorites(car: Car) {
        favorites.removeAll { favorite in favorite == car }
    }
    
    func isInFavorites(car: Car) -> Bool {
        return favorites.contains(car)
    }
    
    func loadCars() async {
        do {
            print("⏳ Loading car data...")
            try await Task.sleep(for: .seconds(1))
            let response: CarsResponse = try load("cars.json")
            cars = response.cars
            filter()
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

enum Destination: Hashable {
    case favorites
    case home
    case settings
}

enum Filter: String {
    case prijs
    case merk
    case jaar
}
