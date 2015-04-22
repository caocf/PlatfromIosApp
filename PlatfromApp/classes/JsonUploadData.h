//
//  JsonUploadData.h
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonUploadData : NSObject

+(NSString * ) getLoginUploadJson:(NSString *) mUserName  : (NSString *) mPassword;

+(NSString * ) getRegisterUploadJson:(NSString *)mUserName : (NSString *) mPassword;

@end
