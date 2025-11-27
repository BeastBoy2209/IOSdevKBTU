//
//  MusicTableViewCell.swift
//  Assignment8
//
//  Custom cell для отображения музыки в таблице
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Configure
    func configure(with music: Music) {
        titleLabel.text = music.fullTitle
        musicImageView.image = UIImage(named: music.imageName)
        musicImageView.contentMode = .scaleAspectFill
        musicImageView.clipsToBounds = true
        musicImageView.layer.cornerRadius = 8
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .default
    }
}
