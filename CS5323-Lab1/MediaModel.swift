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
    
    mutating func addReview(rating: Double, textReview: String, timeSpentOnReview: Int, isQualityReiview: Bool)
}

struct Review {
    var rating: Double
    var textReview: String;
    var timeSpentOnReviewInSeconds: Int;
    var isQualityReview: Bool;
}

struct Movie: MediaItem {
    var id = 0;
    var name = "";
    var coverImage = "";
    var reviews: [Review] = []
    mutating func addReview(rating: Double, textReview: String, timeSpentOnReview: Int, isQualityReiview isQualityReview: Bool) {
        reviews.append(Review(rating: rating, textReview: textReview, timeSpentOnReviewInSeconds: timeSpentOnReview, isQualityReview: isQualityReview))
    }
    
}

struct Show: MediaItem {
    var id = 0;
    var name =  "";
    var coverImage = "";
    var reviews: [Review] = []
    mutating func addReview(rating: Double, textReview: String, timeSpentOnReview: Int, isQualityReiview isQualityReview: Bool) {
        reviews.append(Review(rating: rating, textReview: textReview, timeSpentOnReviewInSeconds: timeSpentOnReview, isQualityReview: isQualityReview))
    }
}

struct Podcast: MediaItem {
    var id = 0;
    var name = "";
    var coverImage = "";
    var hostName = "";
    var reviews: [Review] = []
    mutating func addReview(rating: Double, textReview: String, timeSpentOnReview: Int, isQualityReiview isQualityReview: Bool) {
        reviews.append(Review(rating: rating, textReview: textReview, timeSpentOnReviewInSeconds: timeSpentOnReview, isQualityReview: isQualityReview))
    }
    var latestEpisodes: [LatestEpisodeModel] = []
    mutating func addEpisode(episodeName: String, thumbnailUrl: String) {
        let ep = LatestEpisodeModel();
        ep.episodeTitle = episodeName;
        ep.thumbnailURL = thumbnailUrl;
        latestEpisodes.append(ep);
    }
}


class MediaModel {
    static let shared = MediaModel()
    
    private var mediaItems: Array<MediaItem>
    
    private init() {        
        var nightcrawler = Movie(id: 1, name: "Nightcrawler", coverImage: "https://picfiles.alphacoders.com/112/thumb-1920-112608.jpg");
        nightcrawler.addReview(rating: 4.8, textReview: "Solid Movie.", timeSpentOnReview: 12, isQualityReiview: true);
        
        var gameOfThrones = Show(id: 2, name: "Game Of Thrones", coverImage: "https://yt3.ggpht.com/a-/AAuE7mDeQlEq9zt4QFpI6-6JMdjvDkMBlAlBA8K5sA=s900-mo-c-c0xffffffff-rj-k-no");
        gameOfThrones.addReview(rating: 5.0, textReview: "Amazing Show!", timeSpentOnReview: 15, isQualityReiview: false);
        gameOfThrones.addReview(rating: 4.6, textReview: "Great until the end!", timeSpentOnReview: 22, isQualityReiview: true);
        var lexPodcast = Podcast(id: 3, name: "Lex Fridman Podcast", coverImage: "https://th.bing.com/th/id/OIP.FvQOQJVfjI4BGkQcwPRGiAHaHa?pid=ImgDet&rs=1")
        lexPodcast.addReview(rating: 4.1, textReview: "Cool guests", timeSpentOnReview: 42, isQualityReiview: true)
        lexPodcast.addReview(rating: 4.3, textReview: "I like it!", timeSpentOnReview: 7, isQualityReiview: false)
        lexPodcast.addEpisode(episodeName: "124: Stephen Wolfram", thumbnailUrl: "https://th.bing.com/th/id/OIP.UzQPttZ8bRkfBJNJf6PbLwHaEK?w=311&h=180&c=7&r=0&o=5&dpr=2&pid=1.7")
        lexPodcast.addEpisode(episodeName: "36: Yann Lecun", thumbnailUrl: "https://th.bing.com/th/id/OIP.GX2jzv1gRS15o0PPfGghzAHaEK?w=333&h=187&c=7&r=0&o=5&dpr=2&pid=1.7")
        
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
    
    
    func addReviewForMedia(id: Int, rating: Double, textReview: String, timeSpentOnReview: Int, isQualityReview: Bool) {
        let tr = String(format: "%.2f", rating)
        let rate = Double(tr)!
        
        self.mediaItems[id - 1].addReview(rating: rate, textReview: textReview, timeSpentOnReview: timeSpentOnReview, isQualityReiview: isQualityReview)
    }
    
    
}
