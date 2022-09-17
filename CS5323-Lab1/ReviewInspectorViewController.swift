//
//  ReviewInspectorViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/16/22.
//

import UIKit

class ReviewInspectorViewController: UIViewController {

    @IBOutlet weak var ratingText: UILabel!
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var reviewText: UILabel!
    @IBOutlet weak var toggleTimer: UISwitch!
    
    @IBAction func displayTimerToggled(_ sender: UISwitch) {
        showTimer = sender.isOn;
        
        if(showTimer) {
            self.timerText.text = "Time Spent on Review: \(reviewData.timeSpentOnReviewInSeconds)s"
            
        } else {
            self.timerText.text = "";
        }
    }
    
    @IBAction func exitInspectorButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    var showTimer = true;
    
    
    var reviewData: Review!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleTimer.isOn = true;
        
        self.timerText.text = "Time Spent on Review: \(reviewData.timeSpentOnReviewInSeconds)s"
        self.reviewText.text = reviewData.textReview;
        self.ratingText.text = "Rating: \(reviewData.rating)/5"
        

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
