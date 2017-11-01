//
//  RRTransitionManager+TopBottomAnimation.m
//  Remember
//
//  Created by lx13417 on 2017/10/19.
//  Copyright © 2017年 ifelseboyxx. All rights reserved.
//

#import "RRTransitionManager+TopBottomAnimation.h"

@implementation RRTransitionManager (TopBottomAnimation)

- (void)insideThenPushNextAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    
    toView.frame = CGRectMake(0, -toView.frame.size.height, toView.frame.size.width, toView.frame.size.height);
    
    NSLog(@"%@   %@",NSStringFromCGRect(fromView.frame),NSStringFromCGRect(containerView.frame));
    
    CGRect fromViewRect = fromView.frame;
    
    [UIView animateWithDuration:1.5 animations:^{
        toView.frame = CGRectMake(0, 0, toView.frame.size.width, toView.frame.size.height);
        fromView.frame = CGRectMake(0, fromView.frame.size.height, fromView.frame.size.width, fromView.frame.size.height);
    } completion:^(BOOL finished){
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
         //   fromView.layer.transform = CATransform3DIdentity;
        }else{
            [transitionContext completeTransition:YES];
         //    fromView.layer.transform = CATransform3DIdentity;
        }
    }];
}

- (void)insideThenPushBackAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    UIView *fromView = fromVC.view; // test
    UIView *toView = toVC.view;  // expend
    
    [containerView sendSubviewToBack:toView];
    //[containerView addSubview:fromView];
    [containerView addSubview:toView];
    
    toView.frame = CGRectMake(0, toView.frame.size.height, toView.frame.size.width, toView.frame.size.height);
    
    
    [UIView animateWithDuration:1.5 animations:^{
        fromView.frame = CGRectMake(0, -fromView.frame.size.height, fromView.frame.size.width, fromView.frame.size.height);
        toView.frame = CGRectMake(0, 0, toView.frame.size.width, toView.frame.size.height);
    } completion:^(BOOL finished) {
        [fromView removeFromSuperview];
        fromView.frame = CGRectMake(0, -fromView.frame.size.height, fromView.frame.size.width, fromView.frame.size.height);
        toView.frame = CGRectMake(0, 0, toView.frame.size.width, toView.frame.size.height);
        [transitionContext completeTransition:YES];
    }];
    
}
@end
