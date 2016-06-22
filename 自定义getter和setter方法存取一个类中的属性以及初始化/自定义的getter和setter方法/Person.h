//
//  Person.h
//  自定义的getter和setter方法
//
//  Created by 李献红 on 16/6/15.
//  Copyright © 2016年 李献红. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *school;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy) NSString *bookName;
+ (instancetype)sharedPerson; 
@end
