//
//  MovieViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/14/22.
//

import UIKit

class MovieViewController: UIViewController, ModalViewControllerDelegate {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieCoverImage: UIImageView!
    
    @IBAction func displayReviewsModalButton(_ sender: UIButton) {
        self.showModal(sender: sender)
    }
    
    let mediaModel = MediaModel.shared;
    var movieData: Movie!;
    
    var modalView: ReviewsModalViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalView = storyboard?.instantiateViewController(withIdentifier: "reviewsModalViewController") as? ReviewsModalViewController
        
        self.movieNameLabel.text = self.movieData.name
        
    }
    
    func showModal(sender: AnyObject){
        if(self.modalView?.modalDelegate == nil) {
            self.modalView!.modalDelegate = self;
        }
       
        self.present(self.modalView!, animated: true, completion: nil)
    }
    
    
    func modalDidFinished(){
        self.modalView!.dismiss(animated: true, completion: nil)
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
