//
//  DecodeJsonData.m
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import "DecodeJsonData.h"
#import "JSONKit.h"



@implementation DecodeJsonData

   //  如果json有嵌套，即value里有array、object，如果再使用objectFromJSONString，程序可能会报错（测试结果表明：使用由网络或得到的php/json_encode生成的json时会报错，但使用NSString定义的json字符串时，解析成功），最好使用objectFromJSONStringWithParseOptions：
   //
+(void)decodeResult:(NSMutableDictionary *) mNsResultData success:(IDecodeWithSuccess) success error:(IDecodeWithException) error{

 if(mNsResultData == nil){
  return;
 }
    NSNumber * mSuccess = [mNsResultData objectForKey:@"success"];
    
    
    if([mSuccess isEqualToNumber:[NSNumber numberWithInt:0]]){
        success(mNsResultData);
        return;
    }
    
    error(@"");
// NSMutableDictionary * mJsonData = [mNsResultData objectFromJSONStringWithParseOptions:
//
//                                    JKParseOptionLooseUnicode ];
// [mJsonData objectForKey:@""];
    
    




}





@end
