//
//  LatestEpisodeModel.h
//  CS5323-Lab1
//
//  Created by Nick Wall on 9/16/22.
//

#ifndef LatestEpisodeModel_h
#define LatestEpisodeModel_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface LatestEpisodeModel : NSObject

@property (strong, nonatomic) NSString *episodeTitle;
@property (strong, nonatomic) NSString *thumbnailURL;

@end

NS_ASSUME_NONNULL_END


#endif /* LatestEpisodeModel_h */
