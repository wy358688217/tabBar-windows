//
//  UIView+Category.m
//  tabbarTest
//
//  Created by wang on 15/12/19.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

+ (id)loadMainNib
{
    NSString * className = NSStringFromClass(self.class);
    id object = [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil] firstObject];
    return object;
}

- (void)setZeroOrigin
{
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameX:(CGFloat)frame_x
{
    self.frame = CGRectMake(frame_x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameY:(CGFloat)frame_y
{
    self.frame = CGRectMake(self.frame.origin.x, frame_y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameWidth:(CGFloat)frame_width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, frame_width, self.frame.size.height);
}

- (void)setFrameHeight:(CGFloat)frame_height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, frame_height);
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)setSize:(CGSize)size
{
    self.frame = CGRectMake(0, 0, size.width, size.height);
}

-(CGSize)size
{
    return self.frame.size;
}

-(CGPoint)origin
{
    return self.frame.origin;
}

-(CGFloat)getFrameRight
{
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)getFrameBottom
{
    return self.frame.origin.y + self.frame.size.height;
}


@end
