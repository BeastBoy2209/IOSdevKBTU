//
//  CourseDetailViewController.swift
//  Assignment8
//
//  Detail View Controller для отображения подробной информации о курсе
//

import UIKit

class CourseDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var reviewTextView: UITextView!
    
    // MARK: - Properties
    var course: Course?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureWithCourse()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        courseImageView.contentMode = .scaleAspectFill
        courseImageView.clipsToBounds = true
        courseImageView.layer.cornerRadius = 12
        
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
    
    private func configureWithCourse() {
        guard let course = course else { return }
        
        titleLabel.text = "\(course.title)\nby \(course.instructor)"
        courseImageView.image = UIImage(named: course.imageName)
        descriptionTextView.text = course.description
        reviewTextView.text = "My Review:\n\n\(course.review)"
    }
}
