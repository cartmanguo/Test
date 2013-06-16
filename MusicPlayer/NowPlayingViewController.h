//
//  NowPlayingViewController.h
//  MusicPlayer
//
//  Created by Cartman on 13-6-2.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface NowPlayingViewController : UIViewController
{
    
}
@property (strong, nonatomic) NSArray *musicList;
@property (assign, nonatomic) NSInteger indexOfItem;
@property (strong, nonatomic) AVPlayer *musicPlayer;
@property (strong, nonatomic) UIImageView *albumCoverView;
@property (strong, nonatomic) UIView *playControlPanel;
@property (strong, nonatomic) UISlider *progressSlider;
@property (strong, nonatomic) UIButton *playBtn;
@property (strong, nonatomic) UIButton *nextTrackBtn;
@property (strong, nonatomic) UIButton *previousTrackBtn;

- (id)initWithMusicList:(NSArray *)musicList itemAtIndex:(NSInteger)index currentPlayer:(AVPlayer *)player;
- (void)playNextTrack;
- (void)playPreviousTrack;
- (void)playOrPause;
@end
