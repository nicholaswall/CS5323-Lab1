//
//  ReviewsModalViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/15/22.
//

import UIKit

protocol ModalViewControllerDelegate: AnyObject{
    func modalDidFinished()
}

class ReviewsModalViewController: UIViewController {
    
 
    @IBAction func dismissModalButtonPressed(_ sender: UIButton) {
        print("Pressed")
        if(self.modalDelegate != nil) {
            self.submit(sender: sender)

        }
    }
    
    
    
    weak var modalDelegate: ModalViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.view.backgroundColor = UIColor.orange
//        // Do any additional setup after loading the view.
//        print("delegate: \(self.modalDelegate)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func submit(sender: AnyObject) {
            self.modalDelegate?.modalDidFinished()
    }
}
