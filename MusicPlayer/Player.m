//
//  Player.m
//  
//
//  Created by Cartman on 13-6-16.
//
//

#import "Player.h"

static Player *mPlayer = nil;

@implementation Player

@synthesize musicPlayer;
@synthesize itemURL;

- (id)initWithURL
{
    if(self = [super init])
    {
        //
    }
    return self;
}

+ (Player *)sharedInstanceWithURL:(NSURL *)url
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mPlayer = [[self alloc] init];
    });
    mPlayer.musicPlayer = [AVPlayer playerWithURL:url];
    mPlayer.itemURL = url;
    return mPlayer;
}

- (void)play
{
    [musicPlayer play];
}

@end
