//
//  MovieTableViewCell.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/14/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initialize()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           self.initialize()
       }
    
    func initialize() {
//        self.movieNameLabel = UILabel()
//        print("Initialized movie cell...")
//        self.movieNameLabel?.text = "Default Text from init"
    }

}
