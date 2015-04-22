//
//  HttpUtils.h
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DecodePlatFormResultProtocol.h"
#import  "Define.h"
@interface HttpUtils : NSObject

+(void)sendData :(NSDictionary *)parameters  protocal:(id <DecodePlatFormResultProtocol> ) protocol;

@end
