//
//  ViewController.h
//  MusicPlayer
//
//  Created by Cartman on 13-6-1.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ASIHTTPRequest.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "NowPlayingViewController.h"
#import "MusicInfoCell.h"
#import "Player.h"

@interface ViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    ASIHTTPRequest *request;
    NSMutableDictionary *musicInfo;
    NSArray *allMusic;
    NSMutableArray *songs;
    NSMutableArray *trackURLs;
    NSMutableArray *albumArtworks;
    NSMutableArray *artist;
    NSMutableArray *albumTitles;
    AVPlayer *musicPlayer;
}
@property (strong, nonatomic) NSMutableDictionary *musicInfo;
@property (strong, nonatomic) NSArray *allMusic;
@property (strong, nonatomic) NSMutableArray *songs;
@property (strong, nonatomic) NSMutableArray *trackURLs;
@property (strong, nonatomic) NSMutableArray *albumArtworks;
@property (strong, nonatomic) NSMutableArray *artist;
@property (strong, nonatomic) NSMutableArray *albumTitles;

@property (strong, nonatomic) AVPlayer *musicPlayer;
@property (assign, nonatomic) BOOL isPlaying;
@property (strong, nonatomic) UIBarButtonItem *nowPlayingBtn;
@property (strong, nonatomic) UISegmentedControl *sortTypeControl;
@property (strong, nonatomic) NowPlayingViewController *nowPlayingViewController;

@end
