//
//  AppDelegate.h
//  PlatfromApp
//
//  Created by mac on 15-4-21.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>





@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) UINavigationController *navController;

@end

