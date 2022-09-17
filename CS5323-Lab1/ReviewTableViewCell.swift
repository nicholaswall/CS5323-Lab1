//
//  ReviewTableViewCell.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/16/22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var ratingText: UILabel!
    
    var reviewData: Review!;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
