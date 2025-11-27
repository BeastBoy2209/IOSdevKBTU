//
//  CourseTableViewCell.swift
//  Assignment8
//
//  Custom cell для отображения курса в таблице
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Configure
    func configure(with course: Course) {
        titleLabel.text = course.fullTitle
        courseImageView.image = UIImage(named: course.imageName)
        courseImageView.contentMode = .scaleAspectFill
        courseImageView.clipsToBounds = true
        courseImageView.layer.cornerRadius = 8
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .default
    }
}
