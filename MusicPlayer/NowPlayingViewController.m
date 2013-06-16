//
//  NowPlayingViewController.m
//  MusicPlayer
//
//  Created by Cartman on 13-6-2.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import "NowPlayingViewController.h"
#define BUTTON_WIDTH 50
#define BUTTON_HEIGHT 50
#define BORDER_WIDTH 25
#define DISTANCE_BETWEEN_BUTTONS 60
@interface NowPlayingViewController ()

@end

@implementation NowPlayingViewController

- (id)initWithMusicList:(NSArray *)musicList itemAtIndex:(NSInteger)index currentPlayer:(AVPlayer *)player
{
    if(self = [super init])
    {
        self.musicList = musicList;
        self.indexOfItem = index;
        self.musicPlayer = player;
    }
    return self;
}

- (void)playOrPause
{
    UIImage *playBtnImage = [UIImage imageNamed:@"play"];
    UIImage *pauseBtnImage = [UIImage imageNamed:@"pause"];
    if(self.musicPlayer.rate)
    {
        [self.musicPlayer pause];
        [self.playBtn setBackgroundImage:playBtnImage forState:UIControlStateNormal];
    }
    else
    {
        [self.musicPlayer play];
        [self.playBtn setBackgroundImage:pauseBtnImage forState:UIControlStateNormal];
    }
}

- (void)playNextTrack
{
    self.indexOfItem += 1;
    MPMediaItem *nextTrack = [self.musicList objectAtIndex:self.indexOfItem];
    NSURL *trackURL = [nextTrack valueForProperty:MPMediaItemPropertyAssetURL];
    MPMediaItemArtwork *artwork = [nextTrack valueForProperty:MPMediaItemPropertyArtwork];
    NSString *songTitle = [nextTrack valueForProperty:MPMediaItemPropertyTitle];
    UIImage *albumCover = [artwork imageWithSize:CGSizeMake(320, self.view.bounds.size.height - 200)];
    self.albumCoverView.image = albumCover;
    AVPlayerItem *nextPlayerItem = [AVPlayerItem playerItemWithURL:trackURL];
    [self.musicPlayer replaceCurrentItemWithPlayerItem:nextPlayerItem];
    self.title = songTitle;
}

- (void)playPreviousTrack
{
    self.indexOfItem -= 1;
    MPMediaItem *nextTrack = [self.musicList objectAtIndex:self.indexOfItem];
    NSURL *trackURL = [nextTrack valueForProperty:MPMediaItemPropertyAssetURL];
    MPMediaItemArtwork *artwork = [nextTrack valueForProperty:MPMediaItemPropertyArtwork];
    NSString *songTitle = [nextTrack valueForProperty:MPMediaItemPropertyTitle];
    UIImage *albumCover = [artwork imageWithSize:CGSizeMake(320, self.view.bounds.size.height - 200)];
    self.albumCoverView.image = albumCover;
    AVPlayerItem *nextPlayerItem = [AVPlayerItem playerItemWithURL:trackURL];
    [self.musicPlayer replaceCurrentItemWithPlayerItem:nextPlayerItem];
    self.title = songTitle;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];

    MPMediaItem *nowPlayingItem = [self.musicList objectAtIndex:self.indexOfItem];
    NSString *songTitle = [nowPlayingItem valueForProperty:MPMediaItemPropertyTitle];
    self.title = songTitle;
    [self.musicPlayer addObserver:self forKeyPath:@"rate" options:NSKeyValueObservingOptionNew context:nil];

    //UI Customize
    CGSize screenSize = self.view.frame.size;
    CGFloat height = screenSize.height;
    CGFloat width = screenSize.width;
    
    self.albumCoverView = [[UIImageView alloc] init];
    self.albumCoverView.contentMode = UIViewContentModeScaleToFill;
    self.albumCoverView.frame = CGRectMake(0, 0, width, height - 200);
    MPMediaItemArtwork *albumCover = [nowPlayingItem valueForProperty:MPMediaItemPropertyArtwork];
    UIImage *coverImage = [albumCover imageWithSize:CGSizeMake(400, height - 200)];
    self.albumCoverView.image = coverImage;
    [self.view addSubview:self.albumCoverView];
    
    self.playControlPanel = [[UIView alloc] initWithFrame:CGRectMake(0, self.albumCoverView.frame.size.height, width, 120)];
    self.playControlPanel.backgroundColor = [UIColor whiteColor];
    //UIImage *playBtnImage = [UIImage imageNamed:@"play"];
    UIImage *pauseBtnImage = [UIImage imageNamed:@"pause"];
    UIImage *nextTrackBtnImage = [UIImage imageNamed:@"next"];
    UIImage *prevTrackBtnImage = [UIImage imageNamed:@"prev"];

    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(40, self.playControlPanel.frame.size.height / 2 + 10, 240, 40)];
    UIImage *minValueImage = [UIImage imageNamed:@"white_track.png"];
    UIImage *maxValueImage = [UIImage imageNamed:@"grey_track.png"];
    UIImage *thumbBtnImage = [UIImage imageNamed:@"metal_screw.png"];
    [volumeView setMaximumVolumeSliderImage:maxValueImage forState:UIControlStateNormal];
    [volumeView setMinimumVolumeSliderImage:minValueImage forState:UIControlStateNormal];
    [volumeView setVolumeThumbImage:thumbBtnImage forState:UIControlStateNormal];
    
    volumeView.backgroundColor = [UIColor whiteColor];
    [self.playControlPanel addSubview:volumeView];
    
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.playBtn.frame = CGRectMake(BORDER_WIDTH + BUTTON_WIDTH + DISTANCE_BETWEEN_BUTTONS, 10, BUTTON_WIDTH, BUTTON_HEIGHT);
    [self.playBtn setBackgroundImage:pauseBtnImage forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(playOrPause) forControlEvents:UIControlEventTouchUpInside];
    [self.playControlPanel addSubview:self.playBtn];
    
    self.nextTrackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextTrackBtn.frame = CGRectMake(BORDER_WIDTH + BUTTON_WIDTH * 2 + DISTANCE_BETWEEN_BUTTONS * 2, 10, BUTTON_WIDTH, BUTTON_HEIGHT);
    [self.nextTrackBtn setBackgroundImage:nextTrackBtnImage forState:UIControlStateNormal];
    [self.nextTrackBtn addTarget:self action:@selector(playNextTrack) forControlEvents:UIControlEventTouchUpInside];
    [self.playControlPanel addSubview:self.nextTrackBtn];
    
    self.previousTrackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.previousTrackBtn.frame = CGRectMake(BORDER_WIDTH, 10, BUTTON_WIDTH, BUTTON_HEIGHT);
    [self.previousTrackBtn setBackgroundImage:prevTrackBtnImage forState:UIControlStateNormal];
    [self.previousTrackBtn addTarget:self action:@selector(playPreviousTrack) forControlEvents:UIControlEventTouchUpInside];
    [self.playControlPanel addSubview:self.previousTrackBtn];
    [self.view addSubview:self.playControlPanel];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"rate"])
    {
        if(self.musicPlayer.rate)
        {
            NSLog(@"playing");
        }
        else
        {
            NSLog(@"paused");
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
