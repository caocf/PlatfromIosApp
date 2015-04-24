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
#import "DecodeJsonData.h"

@implementation HttpUtils

+(void)sendData :(NSMutableDictionary *)parameters   protocal:(id <DecodePlatFormResultProtocol> ) protocol{
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 NSMutableDictionary * mUploadParam = [NSMutableDictionary dictionary];
 [mUploadParam setValue:[parameters JSONData] forKey:@"body"];

 [manager POST:APP_URL  parameters:mUploadParam success:^(AFHTTPRequestOperation *operation, id responseObject) {
  NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
  NSLog(@"%@",result);
  [DecodeJsonData decodeResult:result
           success:^(NSMutableDictionary * mResult){
            [protocol onDecoded:nil :YES :mResult];

           }
         error:
   ^(NSString * mReason){
    [protocol onDecoded:mReason :NO :nil];
   }

   ];
  //[protocol onDecoded:nil :YES :nil];
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
  //[protocol onHttpError:@""];
 }];
}

@end
