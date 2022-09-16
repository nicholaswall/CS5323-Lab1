//
//  CreateShowReviewViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/15/22.
//

import UIKit

class CreateShowReviewViewController: UIViewController {
    
    var rating: Float = 5.0;

    @IBAction func createRatingSliderOnChange(_ sender: UISlider) {
        let trunc = String(format: "%.2f", sender.value)
        let truncFloat = Float(trunc)
        self.rating = truncFloat!;
        self.createRatingLabel.text = "Rating: \(self.rating)/5"
    }
    @IBOutlet weak var createRatingLabel: UILabel!
    @IBOutlet weak var createRatingSlider: UISlider!
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        self.submit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createRatingSlider.minimumValue = 0.0
        self.createRatingSlider.maximumValue = 5.0
        
        let trunc = String(format: "%.2f", self.createRatingSlider.value)
        let truncFloat = Float(trunc)
        self.rating = truncFloat!;
        self.createRatingLabel.text = "Rating: \(self.rating)/5"
    }
    
    func submit() {
        navigationController?.popViewController(animated: true)
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
