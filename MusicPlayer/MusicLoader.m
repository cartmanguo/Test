//
//  MusicLoader.m
//  MusicPlayer
//
//  Created by Cartman on 13-6-16.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import "MusicLoader.h"

@implementation MusicLoader

- (void)loadMusicByTitle
{
    MPMediaQuery *songsQuery = [MPMediaQuery songsQuery];
    NSArray *allMusic = [songsQuery items];
    musicByTitle = [NSMutableArray arrayWithArray:allMusic];
}

- (void)loadMusicByArtist
{
    musicByArtist = [[NSMutableArray alloc] init];
    
    MPMediaQuery *artistQuery = [MPMediaQuery artistsQuery];
    NSArray *collections = [artistQuery collections];
    
    for (MPMediaItemCollection *artists in collections){
        [musicByArtist addObject:artists];
    }

}

-(void)loadMusicByAlbum
{
    musicByAlbum = [[NSMutableArray alloc] init];
    
    MPMediaQuery *albumsQuery = [MPMediaQuery albumsQuery];
    NSArray *collections = [albumsQuery collections];
    
    for (MPMediaItemCollection *albums in collections){
        [musicByAlbum addObject:albums];
    }
}

- (void)loadMusicByArtwork
{
    musicByArtwork = [[NSMutableArray alloc] init];
}

- (void)loadMusicByAssetURL
{
    
}

@end
