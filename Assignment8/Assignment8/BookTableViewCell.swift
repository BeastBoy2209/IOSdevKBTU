//
//  BookTableViewCell.swift
//  Assignment8
//
//  Custom cell для отображения книги в таблице
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Configure
    func configure(with book: Book) {
        titleLabel.text = book.fullTitle
        bookImageView.image = UIImage(named: book.imageName)
        bookImageView.contentMode = .scaleAspectFill
        bookImageView.clipsToBounds = true
        bookImageView.layer.cornerRadius = 8
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .default
    }
}
