//
//  DecodeJsonData.h
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DecodeJsonData : NSObject
typedef void (^IDecodeWithSuccess)(NSMutableDictionary * mResult);
typedef void (^IDecodeWithException)(NSString * mReason);


//特别注意是 块代码的时候用得不是指针 而是直接块的名字 作为参数传递
+(void)decodeResult:(NSMutableDictionary *) mNsResultData success:(IDecodeWithSuccess) success error:(IDecodeWithException) error;
@end
