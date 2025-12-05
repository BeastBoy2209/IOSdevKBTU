//
//  HeroStorageManager.swift
//  Assignment10
//
//  Created on 12/5/2025.
//

import Foundation

/// Manager class responsible for persisting and retrieving hero data using UserDefaults
class HeroStorageManager {
    
    // Singleton instance
    static let shared = HeroStorageManager()
    
    // UserDefaults keys
    private enum Keys {
        static let lastHeroID = "lastHeroID"
        static let lastHeroData = "lastHeroData"
    }
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    /// Save the last selected hero to UserDefaults
    /// - Parameter hero: The hero object to save
    func saveLastHero(_ hero: Hero) {
        do {
            let encoder = JSONEncoder()
            let heroData = try encoder.encode(hero)
            defaults.set(heroData, forKey: Keys.lastHeroData)
            defaults.set(hero.id, forKey: Keys.lastHeroID)
            defaults.synchronize()
            print("✅ Hero saved: \(hero.name)")
        } catch {
            print("❌ Error saving hero: \(error.localizedDescription)")
        }
    }
    
    /// Retrieve the last selected hero from UserDefaults
    /// - Returns: The last saved hero, or nil if none exists
    func getLastHero() -> Hero? {
        guard let heroData = defaults.data(forKey: Keys.lastHeroData) else {
            print("ℹ️ No saved hero found")
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let hero = try decoder.decode(Hero.self, from: heroData)
            print("✅ Hero loaded: \(hero.name)")
            return hero
        } catch {
            print("❌ Error loading hero: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// Clear the saved hero data
    func clearLastHero() {
        defaults.removeObject(forKey: Keys.lastHeroData)
        defaults.removeObject(forKey: Keys.lastHeroID)
        defaults.synchronize()
        print("✅ Saved hero cleared")
    }
    
    /// Check if there is a saved hero
    /// - Returns: True if a hero is saved, false otherwise
    func hasSavedHero() -> Bool {
        return defaults.data(forKey: Keys.lastHeroData) != nil
    }
}
