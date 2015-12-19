//
//  UIView+Category.h
//  tabbarTest
//
//  Created by wang on 15/12/19.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)
+ (id)loadMainNib;
- (void)setZeroOrigin;
- (void)setFrameX:(CGFloat)frame_x;
- (void)setFrameY:(CGFloat)frame_y;
- (void)setFrameWidth:(CGFloat)frame_width;
- (void)setFrameHeight:(CGFloat)frame_height;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
@end
