//
//  AppDelegate.h
//  MusicPlayer
//
//  Created by Cartman on 13-6-1.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicLoader.h"

@class RootViewController;
@class OnlineMusicViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RootViewController *viewController;
@property (strong, nonatomic) OnlineMusicViewController *onlineMusicController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) UINavigationController *secondNavController;
@end
