//
//  JsonUploadData.m
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import "JsonUploadData.h"
#import "JSONKit.h"
@implementation JsonUploadData

//Json for data login

+(NSString * ) getLoginUploadJson:(NSString *) mUserName  : (NSString *) mPassword{
 NSMutableDictionary *dict = [NSMutableDictionary dictionary];
 NSString * mUploadJson = nil;
 [dict setObject:@"username" forKey:mUserName];
 [dict setObject:@"passwrod" forKey:mPassword];
  mUploadJson = [dict JSONString];
 return mUploadJson;
};

//Json for data register
+(NSString * ) getRegisterUploadJson:(NSString *)mUserName : (NSString *) mPassword{
 return [self getLoginUploadJson:mUserName :mPassword];
};

@end
