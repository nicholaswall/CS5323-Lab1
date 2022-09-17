//
//  AllMediaTableViewController.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/14/22.
//

import UIKit

class AllMediaTableViewController: UITableViewController {
    
    let mediaModel = MediaModel.shared;

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaModel.getAllMedia().count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let media = mediaModel.getAllMedia();
                
        if media[indexPath.row] is Movie {
            print("\(media[indexPath.row].name) is a Movie")
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)  as! MovieTableViewCell
            let name = media[indexPath.row].name
            cell.movieNameLabel?.text = name;
            return cell
        } else if media[indexPath.row] is Show {
            print("\(media[indexPath.row].name) is a Show")
            let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as! ShowTableViewCell
            let name = media[indexPath.row].name
            cell.showNameLabel?.text = name;
            return cell
        } else{
            print("\(media[indexPath.row].name) is a Podcast")
            let cell = tableView.dequeueReusableCell(withIdentifier: "podcastCell", for: indexPath) as! PodcastTableViewCell
            let name = media[indexPath.row].name
            cell.podcastNameLabel?.text = name;
            return cell
        }
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        print("Selected cell!!!")
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
     
     
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? ShowTableViewCell {
            let showData = mediaModel.getMediaItemByName(name: cell.showNameLabel.text!) as? Show
            
            if let destinationViewController = segue.destination as? ShowViewController {
                destinationViewController.showData = showData;
                return
            } else {
                fatalError("failed to pass data as props")
            }
        }
        
        if let cell = sender as? MovieTableViewCell {
            let movieData = mediaModel.getMediaItemByName(name: cell.movieNameLabel.text!) as? Movie

            if let destinationViewController = segue.destination as? MovieViewController {
                destinationViewController.movieData = movieData
                return
            } else {
                fatalError("Failed to pass data as props")
            }
        }
        
        if let cell = sender as? PodcastTableViewCell {
            let podcastData = mediaModel.getMediaItemByName(name: cell.podcastNameLabel.text!) as? Podcast
            
            if let destinationViewController = segue.destination as? PodcastViewController {
                destinationViewController.podcastData = podcastData
                return
            } else {
                fatalError("Failed to pass data as props")
            }
        }
    
        fatalError("Could not determine segue source cell")
        
    }

}
