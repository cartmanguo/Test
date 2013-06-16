//
//  ViewController.m
//  MusicPlayer
//
//  Created by Cartman on 13-6-1.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import "ViewController.h"
#import "Constant.h"

#define kMUSIC_TITLE_KEY @"music title"
#define kMUSIC_ARTIST_KEY @"artist title"
#define kMUSIC_ALBUM_KEY @"album title"
#define KMUSIC_URL_KEY @"track url"

int a = 1;
@interface ViewController ()

@end

@implementation ViewController
@synthesize allMusic;
@synthesize musicInfo;
@synthesize songs;
@synthesize trackURLs;
@synthesize musicPlayer;
@synthesize albumArtworks;
@synthesize artist;
@synthesize albumTitles;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];

    self.songs = [NSMutableArray array];
    self.trackURLs = [NSMutableArray array];
    self.albumArtworks = [NSMutableArray array];
    self.artist = [NSMutableArray array];
    self.albumTitles = [NSMutableArray array];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.title = @"所有音乐";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.nowPlayingBtn = [[UIBarButtonItem alloc] initWithTitle:@"正在播放"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(enterNowPlayingView)];
    self.navigationItem.rightBarButtonItem = self.nowPlayingBtn;
    
}

- (void)enterNowPlayingView
{
    if(self.musicPlayer.rate || (self.nowPlayingViewController != nil))
    {
        [self.navigationController pushViewController:self.nowPlayingViewController animated:YES];
    }
    else
    {
        //
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
    
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [musicByTitle count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    MusicInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MusicInfoCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
    }
        
    MPMediaItem *musicItem = [musicByTitle objectAtIndex:indexPath.row];
    MPMediaItemArtwork *artwork = [musicItem valueForProperty:MPMediaItemPropertyArtwork];
    UIImage *albumCover = [artwork imageWithSize:CGSizeMake(35, 35)];
    if(!albumCover)
    {
        UIImage *defaultCover = [UIImage imageNamed:@"cover"];
        albumCover = defaultCover;
    }
    cell.albumCoverView.image = albumCover;
    cell.upperTextLabel.text = [musicItem valueForProperty:MPMediaItemPropertyTitle];
    cell.lowerTextLabel.text =  [NSString stringWithFormat:@"%@ - %@",[musicItem valueForProperty:MPMediaItemPropertyArtist],[musicItem valueForProperty:MPMediaItemPropertyAlbumTitle]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MPMediaItem *musicItem = [musicByTitle objectAtIndex:indexPath.row];
    NSURL *trackURL = [musicItem valueForProperty:MPMediaItemPropertyAssetURL];
    if(trackURL)
    {
        Player *player = [Player sharedInstanceWithURL:trackURL];
        [player play];
//        self.musicPlayer = [[AVPlayer alloc] initWithURL:trackURL];
//        [self.musicPlayer play];
//        
//        self.nowPlayingViewController = [[NowPlayingViewController alloc] initWithMusicList:musicByTitle itemAtIndex:indexPath.row currentPlayer:self.musicPlayer];
//        [self.navigationController pushViewController:self.nowPlayingViewController animated:YES];
    }
}


//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if([keyPath isEqualToString:@"rate"])
//    {
//        if(self.musicPlayer.rate)
//        {
//            NSLog(@"playing");
//            self.isPlaying = YES;
//        }
//        else
//        {
//            NSLog(@"paused");
//            self.isPlaying = NO;
//        }
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
