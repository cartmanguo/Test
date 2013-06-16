//
//  SongsOfArtistViewController.h
//  MusicPlayer
//
//  Created by Cartman on 13-6-16.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MusicInfoCell.h"
@interface SongsOfArtistViewController : UITableViewController
{
}

- (id)initWithCollection:(MPMediaItemCollection *)collection index:(NSInteger)index;
@property (strong, nonatomic) MPMediaItemCollection *songsOfArtist;
@property (assign, nonatomic) NSInteger index;
@end
