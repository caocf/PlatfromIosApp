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

+(NSMutableDictionary * ) getLoginUploadJson:(NSString *) mUserName  : (NSString *) mPassword{
 NSMutableDictionary *dict = [NSMutableDictionary dictionary];

 [dict setObject:@"username" forKey:mUserName];
 [dict setObject:@"passwrod" forKey:mPassword];
  
 return dict;
};

//Json for data register
+(NSString * ) getRegisterUploadJson:(NSString *)mUserName : (NSString *) mPassword{
 return [self getLoginUploadJson:mUserName :mPassword];
};

@end
