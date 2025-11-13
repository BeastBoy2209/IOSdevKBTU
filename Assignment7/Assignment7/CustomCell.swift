//
//  CustomCell.swift
//  Assignment7
//
//  Created by Tim Kharitonov on 14.11.2025.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var review: UILabel!
    
    func configure(item: ViewController.CategoryItem) {
        title.text = item.title
        subTitle.text = item.subtitle
        review.text = item.review
        imageLabel.image = item.image
       }
}
