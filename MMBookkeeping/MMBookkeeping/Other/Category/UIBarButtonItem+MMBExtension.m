//
//  UIBarButtonItem+MMBExtension.m
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/10/31.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "UIBarButtonItem+MMBExtension.h"

@implementation UIBarButtonItem (MMBExtension)

+ (instancetype)mmb_barButtonItemWithNormalImg:(NSString *)normalImg hlightImg:(NSString *)hlightImg targrt:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:normalImg];
    [button setImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hlightImg] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)mmb_barButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont target:(id)target action:(SEL)action {
    CGSize maxSize =  CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGSize titleSize = [title boundingRectWithSize:maxSize
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:titleFont}
                                           context:nil].size;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:157/255.0 green:157/255.0 blue:157/255.0 alpha:1.0]
              forState:UIControlStateDisabled];
    
    button.titleLabel.font = titleFont;
    button.bounds = CGRectMake(0, 0, titleSize.width, titleSize.height);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
