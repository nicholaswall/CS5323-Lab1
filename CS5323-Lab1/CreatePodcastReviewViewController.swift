//
//  CreatePodcastReviewViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/15/22.
//

import UIKit

class CreatePodcastReviewViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var createPodcastRatingPicker: UIPickerView!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        self.submit()
    }
    
    @IBAction func onEditingChanged(_ sender: UITextField) {
        self.review = sender.text;
    }
    @IBOutlet weak var timerText: UILabel!
    var arr: Array<Int> = Array<Int>();
    var review: String? = "";
    var timer = Timer();
    var selectedValue: Int = 0
    var num_seconds = 0;
    
    var podcastId: Int!;
    
    lazy var mediaModel = { return MediaModel.shared }()

    @IBAction func qualityReviewChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex;
        
        if(index == 0) {
            self.isQualityReview = true;
        } else {
            self.isQualityReview = false;
        }
    }
    
    
    var isQualityReview = true;
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self;
        
        for i in 0..<6 {
            arr.append(i);
        }
        
        self.createPodcastRatingPicker.delegate = self;
        self.createPodcastRatingPicker.dataSource = self;
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

    }
    
    @objc func timerAction(){
        num_seconds += 1;
        self.timerText.text = "Time Spent on Review: \(num_seconds)s"
    }
    
    func submit() {
        self.mediaModel.addReviewForMedia(id: self.podcastId, rating: Double(self.selectedValue), textReview: review ?? "", timeSpentOnReview: num_seconds, isQualityReview: isQualityReview)
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension CreatePodcastReviewViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
      
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
      
}
  
  
extension CreatePodcastReviewViewController : UIPickerViewDelegate{
      
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedValue = arr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return "\(arr[row])"
      }
}
