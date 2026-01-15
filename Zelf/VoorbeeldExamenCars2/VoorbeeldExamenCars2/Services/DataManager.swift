import Foundation

@Observable
class DataManager {
    var dataStore = DataStore()
    var selectedFilter: Filter = Filter.prijs
    var selectedCar: Car?
    var favorites: [Car] = []
    
    func sort() {
        if selectedFilter == Filter.prijs {
            dataStore.sortByPrice()
        }
        else if selectedFilter == Filter.merk {
            dataStore.sortByBrand()
        }
        else {
            dataStore.sortByYear()
        }
    }
    
    func isInFavorites() -> Bool {
        if let selectedCar = selectedCar {
            return false
        } else {
            return favorites.contains(selectedCar!)
        }
    }
    
    func addToFavorites() {
        if let selectedCar = selectedCar {
            favorites.append(selectedCar)
        }
    }

    func removeFromFavorites() {
        if let selectedCar = selectedCar {
            favorites.removeAll { car in car == selectedCar }
        }
    }
}

enum Filter {
    case prijs
    case merk
    case jaar
}
