//
//  LGCollectionView.h
//  Calendar
//
//  Created by 郭武将 on 2017/5/24.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGDayModel;

typedef void (^yearNumBlock)(LGDayModel *dayMondel);

@interface LGCollectionView : UIView

@property (nonatomic ,assign)BOOL isShowChineseCalendar;

@property (nonatomic, assign) NSInteger currentIndex;

- (void)yearOfCollectionViewMonth:(NSInteger)month yearNumBlock:(yearNumBlock)block;

@end
