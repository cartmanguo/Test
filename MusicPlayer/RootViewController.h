//
//  RootViewController.h
//  MusicPlayer
//
//  Created by Cartman on 13-6-12.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "MusicByArtistViewController.h"
@interface RootViewController : UITableViewController
{
    NSMutableArray *tableItems;
}
@property(strong, nonatomic) ViewController *allMuiscViewController;
@property(strong, nonatomic) MusicByArtistViewController *artistViewController;
@end
