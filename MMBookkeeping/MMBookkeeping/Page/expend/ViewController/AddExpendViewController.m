//
//  AddExpendViewController.m
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/10/30.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "AddExpendViewController.h"
#import "MMBBaseViewController.h"
#import "UIBarButtonItem+MMBExtension.h"

#import "MMBDefaultHeader.h"

@interface AddExpendViewController ()

@property (weak, nonatomic) IBOutlet UIButton *currencyBtn;

- (IBAction)currencyClick:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *coinLabel;
@end

@implementation AddExpendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = [UIBarButtonItem mmb_barButtonItemWithTitle:@"取消"
                                                             titleColor:[UIColor lightGrayColor]
                                                              titleFont:kFont(20)
                                                                 target:self
                                                                 action:@selector(cancelButtonClick)];
    
    UIBarButtonItem *rightItem = [UIBarButtonItem mmb_barButtonItemWithTitle:@"存储"
                                                              titleColor:[UIColor lightGrayColor]
                                                               titleFont:kFont(20)
                                                                  target:self
                                                                  action:@selector(saveButtonClick)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.title = @"添加支出";
    // Do any additional setup after loading the view from its nib.
}

- (void)cancelButtonClick {
    [self dismiss];
}

- (void)saveButtonClick {
    
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

- (IBAction)currencyClick:(id)sender {
}
@end
