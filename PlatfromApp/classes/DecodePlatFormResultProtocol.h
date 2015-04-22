//
//  DecodePlatFormResultProtocol.h
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <Foundation/Foundation.h>


// failure(nil, serializationError); 执行的时候是这么执行的

@protocol DecodePlatFormResultProtocol <NSObject>


@required
-(void) onDecoded :(NSString *)reason : (Boolean) misSuccess :(NSDictionary * ) mResultDictionary;


@optional
-(void) onHttpError :(NSString *) msg;


@end
