//
//  MusicDetailViewController.swift
//  Assignment8
//
//  Detail View Controller для отображения подробной информации о музыке
//

import UIKit

class MusicDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var reviewTextView: UITextView!
    
    // MARK: - Properties
    var music: Music?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureWithMusic()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        musicImageView.contentMode = .scaleAspectFill
        musicImageView.clipsToBounds = true
        musicImageView.layer.cornerRadius = 12
        
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0
        
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.font = .systemFont(ofSize: 16)
        descriptionTextView.textColor = .label
        
        reviewTextView.isEditable = false
        reviewTextView.isScrollEnabled = false
        reviewTextView.font = .systemFont(ofSize: 15)
        reviewTextView.textColor = .secondaryLabel
    }
    
    private func configureWithMusic() {
        guard let music = music else { return }
        
        titleLabel.text = "\(music.title)\n\(music.artist)"
        musicImageView.image = UIImage(named: music.imageName)
        descriptionTextView.text = music.description
        reviewTextView.text = "My Review:\n\n\(music.review)"
    }
}
