//
//  ActiveBean.h
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActiveBean : NSObject

@property ( nonatomic , strong ) NSString *name;

@property ( nonatomic , strong ) NSString *desc;

@property ( nonatomic , assign ) int age;


//反射的一些使用


//unsigned int outCount, i;
//
//objc_property_t *properties = class_copyPropertyList([model class], &outCount);
//
//
//
//for (i=0; i<outCount; i++) {
//
// objc_property_t property = properties[i];
//
//
//
// const char *propertyName =  property_getName(property);
//
// const char *propertyAttribute =  property_getAttributes(property);
//
//
//
// NSString  *name=[NSString  stringWithCString:propertyName
//
//                                     encoding:NSUTF8StringEncoding];
//
//
//
// NSString  *attribute=[NSString  stringWithCString:propertyAttribute
//
//                                          encoding:NSUTF8StringEncoding];
//
//
//
//
//
// id value = [model valueForKey:[NSString stringWithUTF8String:propertyName]];
//
// NSString * key = [[NSStringalloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//
//
//
// NSLog(@"%@==%@\n",name,attribute);
//
// NSLog(@"property[%d]:%@  value:%@\n", i, key, value);
@end
