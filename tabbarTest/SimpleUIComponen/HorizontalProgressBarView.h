//
//  HorizontalProgressBarView.h
//  tabbarTest
//
//  Created by wang on 16/1/11.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalProgressBarView : UIView
@property (assign,nonatomic) CGFloat cornerRadiusValue;
- (instancetype)initProgressImage:(UIImage *)progressImg
                       trackImage:(UIImage *)trackImg
                         withSize:(CGSize)size
                 withCornerRadius:(CGFloat)value;
- (void)setCurrentValue:(CGFloat)currentValue;
@end
