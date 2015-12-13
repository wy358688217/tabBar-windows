//
//  SecondViewController.m
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "SecondViewController.h"
#import "WindowsInfoView.h"

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
    CGRect windowsFrame = [UIScreen mainScreen].bounds;
    self.windowsView = [[[NSBundle mainBundle] loadNibNamed:@"WindowsInfoView" owner:nil options:nil] firstObject];
    self.windowsView.frame = CGRectMake(0, windowsFrame.size.height, self.view.frame.size.width, windowsFrame.size.height);
    [[[UIApplication sharedApplication].windows firstObject] addSubview:self.windowsView];
    self.windowsView.hidden = YES;
}

- (IBAction)onTouch:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kWindowsViewWillShow object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
