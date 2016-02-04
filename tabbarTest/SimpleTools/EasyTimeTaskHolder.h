//
//  EasyTimeTaskHolder.h
//  tabbarTest
//
//  Created by wang on 16/2/4.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimeEventBlock)();

@interface EasyTimeTaskHolder : NSObject
- (void)registerTask:(NSString *)taskStr intervalTime:(NSTimeInterval)interval;
- (void)removeTask:(NSString *)taskStr;
- (void)run:(TimeEventBlock)callback;
- (void)stop;
@end
