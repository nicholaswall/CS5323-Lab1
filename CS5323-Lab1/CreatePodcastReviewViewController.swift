//
//  CreatePodcastReviewViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/15/22.
//

import UIKit

class CreatePodcastReviewViewController: UIViewController {
    @IBOutlet weak var createPodcastRatingPicker: UIPickerView!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        self.submit()
    }
    
    var arr: Array<Int> = Array<Int>();
    
    var selectedValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<6 {
            arr.append(i);
        }
        
        self.createPodcastRatingPicker.delegate = self;
        self.createPodcastRatingPicker.dataSource = self;

    }
    
    func submit() {
        print("submitted rating of \(self.selectedValue)")
        navigationController?.popViewController(animated: true)
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
        print("SELECTED \(arr[row])")
        self.selectedValue = arr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return "\(arr[row])"
      }
}
