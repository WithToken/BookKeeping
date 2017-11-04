//
//  LGWeekView.h
//  Calendar
//
//  Created by 郭武将 on 2017/5/21.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^buttonClickBlock)(BOOL inChoose);

@interface LGWeekView : UIView

@property (nonatomic ,copy) NSString *currentYearMonth; // 当前年份

/*
  上个月或者下个月回调
*/
- (void)selectNextOrLast:(buttonClickBlock)clickButtonBlock;

@end
