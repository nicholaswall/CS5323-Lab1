//
//  ShowViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/14/22.
//

import UIKit

class ShowViewController: UIViewController, ModalViewControllerDelegate {

    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var showCoverImage: UIImageView!
    
    @IBAction func displayReviewsModalButton(_ sender: UIButton) {
        self.showModal(sender: sender)
    
    }
    
    let mediaModel = MediaModel.shared;
    var showData: Show!;
    
    var modalView: ReviewsModalViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalView = storyboard?.instantiateViewController(withIdentifier: "reviewsModalViewController") as? ReviewsModalViewController
        
        self.showNameLabel.text = self.showData.name
        
        self.showCoverImage.loadFrom(URLAddress: showData.coverImage)

    }
    
    func showModal(sender: AnyObject) {
        if(self.modalView?.modalDelegate == nil) {
            self.modalView!.modalDelegate = self;
            self.modalView!.mediaData = self.showData;
        }
        
        self.present(self.modalView!, animated: true, completion: nil)
    }
    
    func modalDidFinished() {
        self.modalView!.dismiss(animated: true, completion: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let destinationViewController = segue.destination as? CreateShowReviewViewController {
            destinationViewController.showId = showData.id;
        }
    }

}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage                    
                }
            }
        }
    }
}
