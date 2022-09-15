//
//  ShowViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/14/22.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var showNameLabel: UILabel!
    
    var ShowName = String()
    
    let mediaModel = MediaModel.shared;
    var showData: Show!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNameLabel.text = ShowName
        
        showData = mediaModel.getMediaItemByName(name: ShowName) as? Show
        
        if(showData == nil) {
            fatalError("Missing Show Data!!!")
        } else {
            print(showData!)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
