//
//  UIBarButtonItem+MMBExtension.h
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/10/31.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MMBExtension)

/**
 图片样式的item
 */
+ (instancetype)mmb_barButtonItemWithNormalImg:(NSString *)normalImg hlightImg:(NSString *)hlightImg targrt:(id)target action:(SEL)action;

/**
 label样式的item
 */

+ (instancetype)mmb_barButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont target:(id)target action:(SEL)action;

@end
