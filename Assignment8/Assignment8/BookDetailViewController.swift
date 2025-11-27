//
//  BookDetailViewController.swift
//  Assignment8
//
//  Detail View Controller для отображения подробной информации о книге
//

import UIKit

class BookDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var reviewTextView: UITextView!
    
    // MARK: - Properties
    var book: Book?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureWithBook()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        bookImageView.contentMode = .scaleAspectFill
        bookImageView.clipsToBounds = true
        bookImageView.layer.cornerRadius = 12
        
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
    
    private func configureWithBook() {
        guard let book = book else { return }
        
        titleLabel.text = "\(book.title)\nby \(book.author)"
        bookImageView.image = UIImage(named: book.imageName)
        descriptionTextView.text = book.description
        reviewTextView.text = "My Review:\n\n\(book.review)"
    }
}
