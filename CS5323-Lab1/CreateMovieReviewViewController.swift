//
//  CreateMovieReviewViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/15/22.
//

import UIKit

class CreateMovieReviewViewController: UIViewController {

    @IBOutlet weak var createMovieRatingLabel: UILabel!
    @IBOutlet weak var createMovieRatingStepper: UIStepper!
    @IBAction func createMovieRatingStepperChanged(_ sender: UIStepper) {
        print(Int(sender.value).description)
        createMovieRatingLabel.text = "Rating: \(Int(sender.value).description)/5"
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        self.submit()
    }
    
    var rating: Double = 3;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createMovieRatingStepper.wraps = true;
        self.createMovieRatingStepper.minimumValue = 0;
        self.createMovieRatingStepper.maximumValue = 5;
        self.createMovieRatingStepper.stepValue = 1;
        self.createMovieRatingStepper.value = self.rating;
        self.createMovieRatingLabel.text = "Rating: \(Int(self.rating).description)/5"
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
