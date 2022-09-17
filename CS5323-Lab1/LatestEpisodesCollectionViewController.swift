//
//  LatestEpisodesCollectionViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/16/22.
//

import UIKit

class LatestEpisodesCollectionViewController: UICollectionViewController {
    
    var podcastData: Podcast!;

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.podcastData.latestEpisodes.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCell", for: indexPath) as? LatestEpisodeCollectionViewCell {
                
                let epThumbnail = self.podcastData.latestEpisodes[indexPath.row].thumbnailURL
                cell.imageUrl = epThumbnail;
                
                cell.episodeThumbnail.contentMode = UIImageView.ContentMode.scaleAspectFit
                let itemSize = UIScreen.main.bounds.width/2 - 3

                 let layout = UICollectionViewFlowLayout()
                 layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                 layout.itemSize = CGSize(width: itemSize, height: itemSize)
                 layout.minimumInteritemSpacing = 3
                 layout.minimumLineSpacing = 3

                 collectionView.collectionViewLayout = layout
                cell.episodeThumbnail.loadFrom(URLAddress: cell.imageUrl)
                
                return cell
                
            } else {
                fatalError("Could not dequeue cell")
            }
        }
}
