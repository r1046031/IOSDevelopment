import Foundation

@Observable
class DataManager {
    var cars: [Car] = []
    var selectedCar: Car?
    var favorites: [Car] = []
    var path = [Destination]()
     
    func addToFavorites(car: Car) {
        favorites.append(car)
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
