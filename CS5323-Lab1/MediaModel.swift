//
//  MediaModel.swift
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/14/22.
//

import Foundation

protocol MediaItem {
    var id: Int { get }
    var name: String { get }
}

struct Movie: MediaItem {
    var id = 0;
    var name = "";
}

struct Show: MediaItem {
    var id = 0;
    var name =  "";
}


class MediaModel {
    static let shared = MediaModel()
    
    private var mediaItems: Array<MediaItem>
    
    private init() {
        print("Initialized singleton MediaModel")
        
        self.mediaItems = [
            Movie(id: 1, name: "Nightcrawler"),
            Show(id: 2, name: "Game of Thrones")
        ];
    }
    
    func getAllMedia() -> Array<MediaItem> {
        return self.mediaItems;
    }
    
    func getMovies() -> Array<Movie> {
        
        func isMovie(item: MediaItem) -> Bool {
            return item is Movie;
        }
        
        let movies = self.mediaItems.filter(isMovie) as! [Movie];
        return movies;
    }
    
    func getShows() -> Array<Show> {
        func isShow(item: MediaItem) -> Bool {
            return item is Show;
        }
        
        let shows = self.mediaItems.filter(isShow) as! [Show];
        return shows;
    }
    
    func getMediaItemByName(name: String) -> MediaItem? {
        return self.mediaItems.first {$0.name == name}
    }
    
    
    
}
