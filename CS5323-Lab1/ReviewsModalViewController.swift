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

class ReviewsModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewTableCell", for: indexPath) as! ReviewTableViewCell
        
        
        let reviewData = mediaData.reviews[indexPath.row]
        cell.reviewData = reviewData;
        
        
        cell.ratingText?.text = "Rating: \(reviewData.rating)/5 - Click for details"

        return cell;
    }
    
    var showAllReviews: Bool = true;
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func dismissModalButtonPressed(_ sender: UIButton) {
        if(self.modalDelegate != nil) {
            self.submit(sender: sender)

        } else {
            print("Something went wrong")
            dismiss(animated: true)
        }
    }
    
    var mediaData: MediaItem!
    
    lazy var mediaModel: MediaModel = {
        return MediaModel.shared;
    } ()
    
    
    
    
    weak var modalDelegate: ModalViewControllerDelegate!
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
                
        self.mediaData = self.mediaModel.getMediaItemByName(name: mediaData.name)
        
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? ReviewTableViewCell {
            let reviewData = cell.reviewData;
            
            
            if let destinationViewController = segue.destination as? ReviewInspectorViewController {
                destinationViewController.reviewData = reviewData;
                return
            } else {
                fatalError("failed to pass data as props")
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

    func submit(sender: AnyObject) {
            self.modalDelegate?.modalDidFinished()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(showAllReviews) {
            return self.mediaData.reviews.count;
        } else {
            func isTop(review: Review) -> Bool {
                return review.rating > 3;
            }
            let numTopReviews = self.mediaData.reviews.filter(isTop).count;
            return numTopReviews;
        }
        
    }
//
//    private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//           // your cell coding
//
//           let cell =  ReviewTableViewCell();
//           return cell;
////           return UITableViewCell()
//       }

    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
           // cell selected code here
       }
}
