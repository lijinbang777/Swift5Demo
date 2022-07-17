//
//  TTTest.m
//  Swift5Demo
//
//  Created by jinbang.li on 2022/7/14.
//  Copyright © 2022 com.test.www. All rights reserved.
//

#import "TTTest.h"
//oc 调swift
#import "Swift5Demo-Swift.h"

@implementation TTTest
+ (void)test{
    //以OC方法调Swift @objcMembers
    TestClass *test = [[TestClass alloc] init];
    [test action];
}
- (void)test{
    
}
@end
