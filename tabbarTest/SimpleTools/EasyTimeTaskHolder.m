//
//  EasyTimeTaskHolder.m
//  tabbarTest
//
//  Created by wang on 16/2/4.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "EasyTimeTaskHolder.h"

@implementation EasyTimeTaskHolder {
    TimeEventBlock mCallback;
    NSTimeInterval mInterval;
    NSMutableDictionary * _mpTaskMap;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _mpTaskMap = [[NSMutableDictionary alloc] initWithCapacity:4];
    }
    return self;
}

- (void)dealloc {
    
}

- (void)registerTask:(NSString *)taskStr intervalTime:(NSTimeInterval)interval {
    
}

- (void)removeTask:(NSString *)taskStr {
    
}

- (void)run:(TimeEventBlock)callback {
    
}

- (void)stop {
    
}
@end
