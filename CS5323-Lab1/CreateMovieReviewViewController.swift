//
//  CreateMovieReviewViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/15/22.
//

import UIKit

class CreateMovieReviewViewController: UIViewController, UITextFieldDelegate {
   
    @IBAction func qualityReviewChanged(_ sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var createMovieRatingLabel: UILabel!
    @IBOutlet weak var createMovieRatingStepper: UIStepper!
    @IBAction func createMovieRatingStepperChanged(_ sender: UIStepper) {
        print(Int(sender.value).description)
        createMovieRatingLabel.text = "Rating: \(Int(sender.value).description)/5"
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        self.submit()
    }
    
    @IBAction func onEditingChanged(_ sender: UITextField) {
        self.review = sender.text;
    }
    @IBOutlet weak var timerText: UILabel!
    var rating: Double = 3;
    var review: String? = "";
    var timer = Timer()
    var num_seconds = 0;
    var qualityReview = true;
    var movieId: Int!;
    
    lazy var mediaModel = { return MediaModel.shared }()

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self;
        
        self.createMovieRatingStepper.wraps = true;
        self.createMovieRatingStepper.minimumValue = 0;
        self.createMovieRatingStepper.maximumValue = 5;
        self.createMovieRatingStepper.stepValue = 1;
        self.createMovieRatingStepper.value = self.rating;
        self.createMovieRatingLabel.text = "Rating: \(Int(self.rating).description)/5"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)


    
    }
    
    @objc func timerAction(){
        num_seconds += 1;
        self.timerText.text = "Time Spent on Review: \(num_seconds)s"
    }
    
    func submit() {
        self.mediaModel.addReviewForMedia(id: self.movieId, rating: Double(rating), textReview: review ?? "", timeSpentOnReview: num_seconds, isQualityReview: true)
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
