//
//  MusicInfoCell.h
//  MusicPlayer
//
//  Created by Cartman on 13-6-12.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *albumCoverView;
@property (weak, nonatomic) IBOutlet UILabel *upperTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowerTextLabel;

@end
