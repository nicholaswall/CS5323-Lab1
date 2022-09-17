//
//  CreateShowReviewViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/15/22.
//

import UIKit

class CreateShowReviewViewController: UIViewController, UITextFieldDelegate {
    
    var rating: Float = 5.0;
    var review: String? = "";
    var timer = Timer();
    var num_seconds = 0;
    var isQualityReview = true;
    var showId: Int!;
    
    lazy var mediaModel = {
        return MediaModel.shared
    }()

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
    @IBAction func onTextInputChanged(_ sender: UITextField) {
        self.review = sender.text;
    }
    @IBOutlet weak var timerText: UILabel!
    @IBAction func qualityReviewChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex;
        if(index == 0) {
            self.isQualityReview = true;
        } else {
            isQualityReview = false;
        }
        
        
    }
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self;
        
//        self.view.addGestureRecognizer(UITapGestureRecognizer)
        
        self.createRatingSlider.minimumValue = 0.0
        self.createRatingSlider.maximumValue = 5.0
        
        let trunc = String(format: "%.2f", self.createRatingSlider.value)
        let truncFloat = Float(trunc)
        self.rating = truncFloat!;
        self.createRatingLabel.text = "Rating: \(self.rating)/5"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction(){
        num_seconds += 1;
        self.timerText.text = "Time Spent on Review: \(num_seconds)s"
    }
    
    func submit() {
        self.mediaModel.addReviewForMedia(id: self.showId, rating: Double(rating), textReview: review ?? "", timeSpentOnReview: num_seconds, isQualityReview: isQualityReview)
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
