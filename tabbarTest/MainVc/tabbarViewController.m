//
//  tabbarViewController.m
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "tabbarViewController.h"
#import "tabbarView.h"
#import "UIView+Category.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"

#define SELECTED_VIEW_CONTROLLER_TAG 98456345

@interface tabbarViewController ()

@end

@implementation tabbarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tabbar = [[tabbarView alloc]initWithFrame:CGRectMake(0,  SCREEN_HEIGHT - 60, 320, 60)];
    _tabbar.delegate = self;
    [self.view addSubview:_tabbar];
    
    _arrayViewcontrollers = [self getViewcontrollers];
    [self touchBtnAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchBtnAtIndex:(NSInteger)index
{
    UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    [currentView removeFromSuperview];
    

    NSDictionary* data = [_arrayViewcontrollers objectAtIndex:index];
    
    UIViewController *viewController = data[@"viewController"];
    viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
    viewController.view.frame = CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGHT- self.tabbar.size.height+10);
    [self.view insertSubview:viewController.view belowSubview:_tabbar];

}

-(NSArray *)getViewcontrollers
{
    NSArray* tabBarItems = nil;
    
    FirstViewController * first = [[FirstViewController alloc]init];//WithNibName:@"FirstViewController" bundle:nil];
    SecondViewController * second = [[SecondViewController alloc]init];
    ThirdViewController * third = [[ThirdViewController alloc]init];
    ForthViewController * forth = [[ForthViewController alloc]init];
    FifthViewController * fifth = [[FifthViewController alloc]init];
    
    
    tabBarItems = [NSArray arrayWithObjects:
                    [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", first, @"viewController",@"主页",@"title", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", second, @"viewController",@"主页",@"title", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", third, @"viewController",@"主页",@"title", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", forth, @"viewController",@"主页",@"title", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", fifth, @"viewController",@"主页",@"title", nil],nil];
    return tabBarItems;
    
}

@end
