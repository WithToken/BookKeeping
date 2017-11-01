//
//  MMBBaseViewController.h
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/10/24.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMBBaseViewController : UIViewController

- (void)pop;

- (void)popToRootVc;

- (void)popToVc:(UIViewController *)vc;

- (void)dismiss;

- (void)dismissWithCompletion:(void(^)())completion;

- (void)presentVc:(UIViewController *)vc;

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion;

- (void)pushVc:(UIViewController *)vc;

- (void)removeChildVc:(UIViewController *)childVc;

- (void)addChildVc:(UIViewController *)childVc;

@end
