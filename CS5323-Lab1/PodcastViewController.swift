//
//  PodcastViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/16/22.
//

import UIKit

class PodcastViewController: UIViewController, ModalViewControllerDelegate {
    
    @IBOutlet weak var podcastNameLabel: UILabel!
    @IBOutlet weak var podcastCoverImage: UIImageView!
    
    @IBAction func displayReviewsModalButton(_ sender: UIButton) {
        self.showModal(sender: sender)
    }
    
    let mediaModel = MediaModel.shared;
    var podcastData: Podcast!;
    
    var modalView: ReviewsModalViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalView = storyboard?.instantiateViewController(withIdentifier: "reviewsModalViewController") as? ReviewsModalViewController
        
        self.podcastNameLabel.text = self.podcastData.name
        self.podcastCoverImage.loadFrom(URLAddress: self.podcastData.coverImage)
    }
    
    func showModal(sender: AnyObject) {
        if (self.modalView?.modalDelegate == nil) {
            self.modalView!.mediaData = self.podcastData;
            self.modalView!.modalDelegate = self;
        }
        
        self.present(self.modalView!, animated: true, completion: nil)
    }
    
    func modalDidFinished() {
        self.modalView!.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? InspectImageViewController {
            destinationViewController.imageUrl = self.podcastData.coverImage
        }
        
        if let destinationViewController = segue.destination as? LatestEpisodesCollectionViewController {
            destinationViewController.podcastData = self.podcastData;
        }
        
        if let destinationViewController = segue.destination as? CreatePodcastReviewViewController {
            destinationViewController.podcastId = self.podcastData.id;
        }
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

