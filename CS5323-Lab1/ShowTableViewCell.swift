//
//  ShowTableViewCell.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/14/22.
//

import UIKit

class ShowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var showNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        print("Selected!!!!!!")

        // Configure the view for the selected state
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    guard let firstVC = segue.destination as? FirstViewController else { return }
//    firstVC.firstname = textFieldFirstName.text
//    }

}
