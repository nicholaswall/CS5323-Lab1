//
//  InspectImageViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/16/22.
//

import UIKit

class InspectImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageUrl: String  = "";
    
    lazy private var imageView: UIImageView? = {
        return UIImageView(frame: CGRect(x:0, y:0, width:1080, height:720))
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView = UIImageView(frame: CGRect(x:0, y:0, width:1080, height:720))
        self.imageView!.loadFrom(URLAddress: self.imageUrl)
        self.scrollView.addSubview(self.imageView!)
        
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        self.scrollView.minimumZoomScale = 0.1;
        self.scrollView.delegate = self;
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView;
    }
    
}
