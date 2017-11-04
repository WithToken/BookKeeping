//
//  LGCalendar.m
//  Calendar
//
//  Created by 郭武将 on 2017/5/21.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "LGCalendar.h"
#import "LGCollectionView.h"
#import "LGWeekView.h"
#import "LGCalendarModel.h"

@interface LGCalendar ()

@property (nonatomic ,strong) LGCollectionView *collectionView;
@property (nonatomic ,strong) LGWeekView *weekView;

@end

@implementation LGCalendar

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setIsShowChineseCalendar:(BOOL)isShowChineseCalendar {
    _isShowChineseCalendar = isShowChineseCalendar;
    self.collectionView.isShowChineseCalendar = isShowChineseCalendar;
}
- (void)setUp {
    [self addSubview:self.weekView];
    [self addSubview:self.collectionView];
    
    __weak typeof(self) weakSelf = self;
    [self.collectionView yearOfCollectionViewMonth:0 yearNumBlock:^(LGDayModel *dayMondel) {
        weakSelf.weekView.currentYearMonth = [NSString stringWithFormat:@"%ld/%ld",(long)dayMondel.yearForMonth,(long)dayMondel.numForMonth];
    }];
    
    [self.weekView selectNextOrLast:^(BOOL choose){
        NSInteger month = weakSelf.collectionView.currentIndex;
        static UIViewAnimationOptions animationOption = UIViewAnimationOptionTransitionCrossDissolve;
        if (choose) {
            month ++;
        } else {
            month --;
        }
        [UIView transitionWithView:weakSelf.collectionView duration:0.8 options:animationOption animations:^{
            [weakSelf.collectionView yearOfCollectionViewMonth:month yearNumBlock:^(LGDayModel *dayMondel) {
                weakSelf.weekView.currentYearMonth = [NSString stringWithFormat:@"%ld/%ld",(long)dayMondel.yearForMonth,(long)dayMondel.numForMonth];
            }];
        } completion:nil];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat h = CGRectGetHeight(self.frame);
    CGFloat w = CGRectGetWidth(self.frame);
    self.weekView.frame = CGRectMake(0, 0, w, 45);
    CGFloat dayView_w = CGRectGetWidth(self.weekView.frame);
    CGFloat dayView_h = h - CGRectGetHeight(self.weekView.frame);
    self.collectionView.frame = CGRectMake(0, CGRectGetMaxY(self.weekView.frame), dayView_w, dayView_h - 16);
}

- (LGCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[LGCollectionView alloc]initWithFrame:CGRectZero];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (LGWeekView *)weekView {
    if (!_weekView) {
        _weekView = [[LGWeekView alloc]initWithFrame:CGRectZero];
        _weekView.backgroundColor = [UIColor whiteColor];
    }
    return _weekView;
}

@end
