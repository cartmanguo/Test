//
//  Player.h
//  
//
//  Created by Cartman on 13-6-16.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface Player : NSObject
{
    AVPlayer *musicPlayer;
    NSURL *itemURL;
}
@property (strong, nonatomic) AVPlayer *musicPlayer;
@property (strong, nonatomic) NSURL *itemURL;
+ (Player *)sharedInstanceWithURL:(NSURL *)url;
- (void)play;
@end
