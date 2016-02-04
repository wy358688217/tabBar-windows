//
//  EasyTime.m
//  tabbarTest
//
//  Created by wang on 16/2/2.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "EasyTime.h"

@implementation EasyTime
{
    TimeBlockCallback mCallback;
    NSTimer * _mpTimer;
    NSTimeInterval mInterval;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    [_mpTimer invalidate];
    SAFE_RELEASE(_mpTimer);
}

- (void)runWithTime:(NSTimeInterval)interval withBlock:(TimeBlockCallback)callback {
    mCallback = callback;
    mInterval = interval >= 0.0 ? interval : 1.f;
    
    [self startTime];
}

- (void)startTime {
    if (_mpTimer) {
        return;
    }
    _mpTimer = [NSTimer scheduledTimerWithTimeInterval:mInterval target:self selector:@selector(loopFunc) userInfo:nil repeats:YES];
}

- (void)loopFunc {
    if (_mpTimer && mCallback) {
        mCallback();
    }
}

- (void)stop {
    if (_mpTimer) {
        [_mpTimer invalidate];
        SAFE_RELEASE(_mpTimer);
    }
}
@end
