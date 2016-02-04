//
//  EasyTime.h
//  tabbarTest
//
//  Created by wang on 16/2/2.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimeBlockCallback)();

@interface EasyTime : NSObject
- (void)runWithTime:(NSTimeInterval)interval withBlock:(TimeBlockCallback)callback;
- (void)stop;
@end
