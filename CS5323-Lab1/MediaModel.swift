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
    var coverImage: String { get }
    var reviews: [Review] { get }
    
    mutating func addReview(rating: Double)
}

struct Review {
    var rating: Double
}

struct Movie: MediaItem {
    var id = 0;
    var name = "";
    var coverImage = "";
    var reviews: [Review] = []
    mutating func addReview(rating: Double) {
        reviews.append(Review(rating: rating))
    }
    
}

struct Show: MediaItem {
    var id = 0;
    var name =  "";
    var coverImage = "";
    var reviews: [Review] = []
    mutating func addReview(rating: Double) {
        reviews.append(Review(rating: rating))
    }
}

struct Podcast: MediaItem {
    var id = 0;
    var name = "";
    var coverImage = "";
    var hostName = "";
    var reviews: [Review] = []
    mutating func addReview(rating: Double) {
        reviews.append(Review(rating: rating))
    }
}


class MediaModel {
    static let shared = MediaModel()
    
    private var mediaItems: Array<MediaItem>
    
    private init() {        
        var nightcrawler = Movie(id: 1, name: "Nightcrawler");
        nightcrawler.addReview(rating: 4.8);
        var gameOfThrones = Show(id: 2, name: "Game Of Thrones");
        gameOfThrones.addReview(rating: 5.0);
        gameOfThrones.addReview(rating: 4.6);
        var lexPodcast = Podcast(id: 3, name: "Lex Fridman Podcast")
        lexPodcast.addReview(rating: 4.1)
        lexPodcast.addReview(rating: 4.3)
        
        self.mediaItems = [
            nightcrawler, gameOfThrones, lexPodcast
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
    
    func getPodcasts() -> Array<Podcast> {
        func isPodcast(item: MediaItem) -> Bool {
            return item is Podcast;
        }
        
        let podcasts = self.mediaItems.filter(isPodcast) as! [Podcast];
        return podcasts;
    }
    
    func getMediaItemByName(name: String) -> MediaItem? {
        return self.mediaItems.first {$0.name == name}
    }
    
    
    
}
