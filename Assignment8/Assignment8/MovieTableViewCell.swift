//
//  MovieTableViewCell.swift
//  Assignment8
//
//  Custom cell для отображения фильма в таблице
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Configure
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        movieImageView.image = UIImage(named: movie.imageName)
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 8
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .default
    }
}
