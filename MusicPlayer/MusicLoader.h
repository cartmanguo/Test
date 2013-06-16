//
//  MusicLoader.h
//  MusicPlayer
//
//  Created by Cartman on 13-6-16.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Constant.h"

extern NSMutableArray *musicByTitle;
extern NSMutableArray *musicByArtist;
extern NSMutableArray *musicByAlbum;
extern NSMutableArray *musicByArtwork;
extern NSMutableArray *musicByURL;
@interface MusicLoader : NSObject
{
    
}

- (void)loadMusicByTitle;
- (void)loadMusicByArtist;
- (void)loadMusicByAlbum;
- (void)loadMusicByArtwork;
- (void)loadMusicByAssetURL;
@end
