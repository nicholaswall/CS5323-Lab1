//
//  PodcastTableViewCell.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/15/22.
//

import UIKit

class PodcastTableViewCell: UITableViewCell {

    @IBOutlet weak var podcastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
