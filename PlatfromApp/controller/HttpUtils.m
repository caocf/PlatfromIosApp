//
//  HttpUtils.m
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import "HttpUtils.h"
#import "AFHTTPRequestOperationManager.h"
#import "JSONKit.h"

@implementation HttpUtils

+(void)sendData :(NSDictionary *)parameters   protocal:(id <DecodePlatFormResultProtocol> ) protocol{
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 NSDictionary * mUploadParam = [NSDictionary dictionary];
 [mUploadParam setValue:[parameters JSONData] forKey:@"body"];

 [manager POST:APP_URL  parameters:mUploadParam success:^(AFHTTPRequestOperation *operation, id responseObject) {

  [protocol onDecoded:nil :YES :nil];
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

 }];
}

@end
