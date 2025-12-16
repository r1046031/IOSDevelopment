import Foundation

struct Car: Identifiable, Codable, Hashable {
    let id: Int
    let brand: String
    let model: String
    let year: Int
    let price: Double
    let color: String
    let fuelType: String
    let imageURL: String
    
//    init(from: Car) {
//        self.id = from.id
//        self.brand = from.brand
//        self.model = from.model
//        self.year = from.year
//        self.price = from.price
//        self.color = from.color
//        self.fuelType = from.fuelType
//        self.imageURL = from.imageURL
//    }
}

struct CarsResponse: Codable {
    let cars: [Car]
}
