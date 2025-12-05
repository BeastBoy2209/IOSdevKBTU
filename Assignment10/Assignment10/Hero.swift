import Foundation

struct Hero: Sendable, nonisolated Codable {
    let id: Int
    let name: String
    let biography: Biography
    let appearance: Appearance
    let powerstats: Powerstats
    let images: Images
}

struct Biography: Sendable, nonisolated Codable {
    let fullName: String?
    let placeOfBirth: String?
    let publisher: String?
    let alignment: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName
        case placeOfBirth
        case publisher
        case alignment
    }
}

struct Appearance: Sendable, nonisolated Codable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
}

struct Powerstats: Sendable, nonisolated Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

struct Images: Sendable, nonisolated Codable {
    let md: String
}
