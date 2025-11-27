import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imagePrev: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var labelName: UILabel!
    // Additional labels
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    //UIProgressView
    @IBOutlet weak var intelligenceProgressView: UIProgressView!
    @IBOutlet weak var strengthProgressView: UIProgressView!
    @IBOutlet weak var speedProgressView: UIProgressView!
    @IBOutlet weak var durabilityProgressView: UIProgressView!
    @IBOutlet weak var powerProgressView: UIProgressView!
    @IBOutlet weak var combatProgressView: UIProgressView!
    
    var heroes: [Hero] = []
    
    @IBAction func nextTapped(_ sender: UIButton) {
        displayRandomHero()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchHeroes()
    }
    
    
    // MARK: - Heroes
    func fetchHeroes() {
        guard let url = URL(string: "https://akabab.github.io/superhero-api/api/all.json") else {
            print("bad URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            guard let data = data else {
                print("No data found")
                return
            }
            
            do {
                let decodedHeroes = try JSONDecoder().decode([Hero].self, from: data)
                
                DispatchQueue.main.async {
                    self.heroes = decodedHeroes
                    self.displayRandomHero()
                }
            } catch {
                print("catching error: \(error)")
            }
        }
        task.resume()
    }
    
    private func displayRandomHero() {
        guard let hero = heroes.randomElement() else { return }
        
        labelName.text = hero.name
        if hero.biography.fullName != "" {
            fullNameLabel.text = hero.biography.fullName
        } else {
            fullNameLabel.text = "Full Name: unknown"
        }
        alignmentLabel.text = "Alignment: \(hero.biography.alignment ?? "Unknown")"
        placeOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth ?? "Unknown")"
        genderLabel.text = "Gender: \(hero.appearance.gender ?? "Unknown")"
        raceLabel.text = "Race: \(hero.appearance.race ?? "Unknown")"
        let heightText = hero.appearance.height?.first ?? "Unknown"
        let weightText = hero.appearance.weight?.first ?? "Unknown"
        heightLabel.text = "Height: \(heightText)"
        weightLabel.text = "Weight: \(weightText)"
        publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "Unknown")"
        
        // Power stats mapped to 0...1
        intelligenceProgressView.progress = normalized(hero.powerstats.intelligence)
        strengthProgressView.progress = normalized(hero.powerstats.strength)
        speedProgressView.progress = normalized(hero.powerstats.speed)
        durabilityProgressView.progress = normalized(hero.powerstats.durability)
        powerProgressView.progress = normalized(hero.powerstats.power)
        combatProgressView.progress = normalized(hero.powerstats.combat)
        
        // Load image
        let url = URL(string: hero.images.md)!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imagePrev.image = image
            }
        }.resume()
    }
    
    private func normalized(_ value: Int?) -> Float {
        guard let value = value else { return 0.0 }
        return Float(value) / 100.0
    }
}
