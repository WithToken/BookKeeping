//
//  LGCalendarManager.h
//  Calendar
//
//  Created by 郭武将 on 2017/5/24.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^daysArrayBlock)(NSArray *daysArray);

@interface LGCalendarManager : NSObject

+ (instancetype)defaultManager;

// 取模型数组方法
- (void)dayArrayWithMonth:(NSInteger)month dayArrBlock:(daysArrayBlock)daysArrayBlock;

@end
