//
//  DecodeJsonData.h
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DecodeJsonData : NSObject
typedef void (^IDecodeResult)();

+(void)decodeResult:(NSString *) mNsResultData onDecode:(IDecodeResult *) mResult;
@end
