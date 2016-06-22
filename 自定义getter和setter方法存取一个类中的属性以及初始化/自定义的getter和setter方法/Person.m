//
//  Person.m
//  自定义的getter和setter方法
//
//  Created by 李献红 on 16/6/15.
//  Copyright © 2016年 李献红. All rights reserved.
//

#import "Person.h"

@implementation Person
@dynamic name;
@dynamic school;
@dynamic age;
@dynamic bookName;
+ (instancetype)sharedPerson {
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


- (instancetype)init {

    if (!(self = [super init])) {
        return self;
    }
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObjectsAndKeys:@"小明",@"name", @"大李小学",@"school",[NSNumber numberWithInt:7],@"age",@"英雄",@"bookName",nil]];
    
    
    return self;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {

    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel hasPrefix:@"set"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [NSMethodSignature signatureWithObjCTypes:"@@:"];
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {

    NSString *key = NSStringFromSelector(anInvocation.selector);
    if ([key hasPrefix:@"set"]) {

        NSRange firstChar, rest;
        //从第3个位置截取长度为1的字符串
        firstChar.location  = 3;
        firstChar.length    = 1;
        //从第4个位置开始截取长度为 length - 5的字符串  elperVersion
        rest.location       = 4;
        rest.length         = key.length - 5;
        
        key = [NSString stringWithFormat:@"%@%@",
                    [[key substringWithRange:firstChar] lowercaseString],
                    [key substringWithRange:rest]];
        
        id value;
        [anInvocation getArgument:&value atIndex:2];
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
        NSLog(@"%@",value);
    } else {
    
        id value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        [anInvocation setReturnValue:&value];
    }
}

@end
