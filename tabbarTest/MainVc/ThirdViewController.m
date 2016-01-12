//
//  ThirdViewController.m
//  tabbarTest
//
//  Created by wy0012 on 15/12/23.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "ThirdViewController.h"
#import "HorizontalProgressBarView.h"
#import "UIView+Category.h"

@interface ThirdViewController ()
@property (strong,nonatomic)HorizontalProgressBarView * horizontaView;
@property (assign, nonatomic)CGFloat miCurrentValue;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _horizontaView = [[HorizontalProgressBarView alloc]initProgressImage:[UIImage imageNamed:@"valet_2_loading"]
                                                                  trackImage:[UIImage imageNamed:@"valet_2_loading_bg"]
                                                                    withSize:CGSizeMake(225, 15)
                                                            withCornerRadius:7.5
                                                                       model:DrawProgressBarByImage];
    [_horizontaView setFrameY:200];
    [_horizontaView setCenterX:SCREEN_WIDTH*0.5];
    [self.view addSubview:_horizontaView];
//    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- 点击事件

- (IBAction)onSubtract:(id)sender {
    self.miCurrentValue -= 0.1;
    self.horizontaView.currentValue = self.miCurrentValue;
}

- (IBAction)onAdd:(id)sender {
    self.miCurrentValue += 0.05;
    self.horizontaView.currentValue = self.miCurrentValue;
}



@end
