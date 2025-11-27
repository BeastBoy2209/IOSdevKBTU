//
//  MovieDetailViewController.swift
//  Assignment8
//
//  Detail View Controller для отображения подробной информации о фильме
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var reviewTextView: UITextView!
    
    // MARK: - Properties
    var movie: Movie?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureWithMovie()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Configure Image View
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 12
        
        // Configure Title Label
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.numberOfLines = 0
        
        // Configure Description Text View
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.font = .systemFont(ofSize: 16)
        descriptionTextView.textColor = .label
        
        // Configure Review Text View
        reviewTextView.isEditable = false
        reviewTextView.isScrollEnabled = false
        reviewTextView.font = .systemFont(ofSize: 15)
        reviewTextView.textColor = .secondaryLabel
    }
    
    private func configureWithMovie() {
        guard let movie = movie else { return }
        
        titleLabel.text = movie.title
        movieImageView.image = UIImage(named: movie.imageName)
        descriptionTextView.text = movie.description
        reviewTextView.text = "My Review:\n\n\(movie.review)"
    }
}
