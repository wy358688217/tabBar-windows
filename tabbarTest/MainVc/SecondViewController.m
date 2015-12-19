//
//  SecondViewController.m
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "SecondViewController.h"
#import "WindowsInfoView.h"
#import "UIView+Category.h"

@interface SecondViewController ()
@property(weak,nonatomic) WindowsInfoView * windowsView;
@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createWindowsView];
}

- (void)createWindowsView
{
    if (self.windowsView) {
        return;
    }
    self.windowsView = [WindowsInfoView loadMainNib];
    self.windowsView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[[UIApplication sharedApplication].windows firstObject] addSubview:self.windowsView];
    self.windowsView.hidden = YES;
}

- (IBAction)onTouch:(id)sender
{
    [NotificationCenter postNotificationName:kWindowsViewWillShow object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
