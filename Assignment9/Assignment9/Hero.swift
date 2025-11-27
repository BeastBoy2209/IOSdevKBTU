import Foundation

struct Hero: Codable {
    let id: Int
    let name: String
    let biography: Biography
    let appearance: Appearance
    let powerstats: Powerstats
    let images: Images
}

struct Biography: Codable {
    let fullName: String?
    let placeOfBirth: String?
    let publisher: String?
    let alignment: String?
}

struct Appearance: Codable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
}

struct Powerstats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

struct Images: Codable {
    let md: String
}
