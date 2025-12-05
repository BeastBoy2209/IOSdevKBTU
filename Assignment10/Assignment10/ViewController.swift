import UIKit
import Kingfisher

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
    
    // Loading indicator
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let contentView = UIView()
    
    var heroes: [Hero] = []
    
    @IBAction func nextTapped(_ sender: UIButton) {
        displayRandomHero()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        // Check if there's a saved hero
        if let savedHero = HeroStorageManager.shared.getLastHero() {
            print("Loading saved hero from UserDefaults")
            displayHero(savedHero)
        } else {
            // If no saved hero, fetch a new one
            fetchHeroes()
        }
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        // Setup loading indicator
        activityIndicator.color = .systemBlue
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Configure image view for better display
        imagePrev.contentMode = .scaleAspectFill
        imagePrev.clipsToBounds = true
        imagePrev.layer.cornerRadius = 10
        
        // Style the button
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = .systemBlue
        nextButton.setTitleColor(.white, for: .normal)
    }
    
    // MARK: - Loading State
    private func showLoading() {
        activityIndicator.startAnimating()
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
    }
    
    private func hideLoading() {
        activityIndicator.stopAnimating()
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }
    
    
    // MARK: - Heroes Networking
    func fetchHeroes() {
        showLoading()
        
        NetworkManager.shared.fetchAllHeroes { [weak self] result in
            guard let self = self else { return }
            
            self.hideLoading()
            
            switch result {
            case .success(let heroes):
                self.heroes = heroes
                self.displayRandomHero()
                
            case .failure(let error):
                self.showError(message: "Failed to load heroes: \(error.localizedDescription)")
            }
        }
    }
    
    private func displayRandomHero() {
        guard let hero = heroes.randomElement() else {
            // If heroes array is empty, fetch from network
            fetchHeroes()
            return
        }
        
        displayHero(hero)
        
        // Save the hero to UserDefaults
        HeroStorageManager.shared.saveLastHero(hero)
    }
    
    private func displayHero(_ hero: Hero) {
        // Animate the transition
        animateContentChange {
            // Update all labels
            self.labelName.text = hero.name
            
            if let fullName = hero.biography.fullName, !fullName.isEmpty {
                self.fullNameLabel.text = "Full Name: \(fullName)"
            } else {
                self.fullNameLabel.text = "Full Name: Unknown"
            }
            
            self.alignmentLabel.text = "Alignment: \(hero.biography.alignment ?? "Unknown")"
            self.placeOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth ?? "Unknown")"
            self.genderLabel.text = "Gender: \(hero.appearance.gender ?? "Unknown")"
            self.raceLabel.text = "Race: \(hero.appearance.race ?? "Unknown")"
            
            let heightText = hero.appearance.height?.first ?? "Unknown"
            let weightText = hero.appearance.weight?.first ?? "Unknown"
            self.heightLabel.text = "Height: \(heightText)"
            self.weightLabel.text = "Weight: \(weightText)"
            self.publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "Unknown")"
            
            // Update power stats with animation
            self.updateProgressViews(hero: hero)
            
            // Load image with Kingfisher
            self.loadHeroImage(urlString: hero.images.md)
        }
    }
    
    private func updateProgressViews(hero: Hero) {
        let duration: TimeInterval = 0.5
        
        UIView.animate(withDuration: duration) {
            self.intelligenceProgressView.setProgress(self.normalized(hero.powerstats.intelligence), animated: true)
            self.strengthProgressView.setProgress(self.normalized(hero.powerstats.strength), animated: true)
            self.speedProgressView.setProgress(self.normalized(hero.powerstats.speed), animated: true)
            self.durabilityProgressView.setProgress(self.normalized(hero.powerstats.durability), animated: true)
            self.powerProgressView.setProgress(self.normalized(hero.powerstats.power), animated: true)
            self.combatProgressView.setProgress(self.normalized(hero.powerstats.combat), animated: true)
        }
    }
    
    private func loadHeroImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            imagePrev.image = UIImage(systemName: "person.crop.circle.badge.exclamationmark")
            return
        }
        
        // Use Kingfisher to load and cache images
        let processor = DownsamplingImageProcessor(size: imagePrev.bounds.size)
        imagePrev.kf.indicatorType = .activity
        
        imagePrev.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "person.crop.circle"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ]
        ) { result in
            switch result {
            case .success(let value):
                print("✅ Image loaded: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("❌ Image loading error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Animation
    private func animateContentChange(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 0.7
        }) { _ in
            completion()
            UIView.animate(withDuration: 0.2) {
                self.view.alpha = 1.0
            }
        }
    }
    
    // MARK: - Error Handling
    private func showError(message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
            self?.fetchHeroes()
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
    
    // MARK: - Helper
    private func normalized(_ value: Int?) -> Float {
        guard let value = value else { return 0.0 }
        return Float(value) / 100.0
    }
}
