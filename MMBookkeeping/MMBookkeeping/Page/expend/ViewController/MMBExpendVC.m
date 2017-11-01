//
//  MMBExpendVC.m
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/10/23.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "MMBExpendVC.h"
#import "RRTransition.h"
#import "MMBNavigationController.h"
#import "AddExpendViewController.h"

@interface MMBExpendVC ()


@end

@implementation MMBExpendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"支出";
}

- (void)doubleClickTabBar {
    AddExpendViewController *vc = [[AddExpendViewController alloc]initWithNibName:@"AddExpendViewController" bundle:nil];
    MMBNavigationController *nav = [[MMBNavigationController alloc]initWithRootViewController:vc];
    [self presentVc:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
