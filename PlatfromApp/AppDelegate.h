//
//  AppDelegate.h
//  PlatfromApp
//
//  Created by mac on 15-4-21.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpUtils.h"

#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>




@property (strong ,nonatomic) HttpUtils *mHttpUtils;
@property (strong, nonatomic) UIWindow *window;



@end

