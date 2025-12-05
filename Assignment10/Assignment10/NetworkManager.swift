import Foundation
import Alamofire

/// Network manager responsible for fetching superhero data from the API
final class NetworkManager {
    
    // Singleton instance
    static let shared = NetworkManager()
    
    // API endpoint
    private let apiURL = "https://akabab.github.io/superhero-api/api/all.json"
    
    private init() {}
    
    /// Fetch all heroes from the API
    /// - Parameter completion: Completion handler with Result containing array of heroes or error
    nonisolated func fetchAllHeroes(completion: @escaping (Result<[Hero], Error>) -> Void) {
        AF.request(apiURL, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [Hero].self) { response in
                switch response.result {
                case .success(let heroes):
                    print("✅ Successfully fetched \(heroes.count) heroes")
                    completion(.success(heroes))
                    
                case .failure(let error):
                    print("❌ Error fetching heroes: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
    
    /// Fetch a random hero from the API
    /// - Parameter completion: Completion handler with Result containing a hero or error
    func fetchRandomHero(completion: @escaping (Result<Hero, Error>) -> Void) {
        fetchAllHeroes { result in
            switch result {
            case .success(let heroes):
                if let randomHero = heroes.randomElement() {
                    completion(.success(randomHero))
                } else {
                    completion(.failure(NSError(domain: "NetworkManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "No heroes available"])))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
