//
//  LGWeekView.m
//  Calendar
//
//  Created by 郭武将 on 2017/5/21.
//  Copyright © 2017年 郭武将. All rights reserved.
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "LGWeekView.h"

@interface LGWeekView ()

@property (nonatomic ,strong) NSMutableArray *weekNameArr; // 周一....周日数组
@property (nonatomic ,strong) UIButton *lastMonthButton; //上个月按钮
@property (nonatomic ,strong) UIButton *nextMonthButton; //下个月按钮
@property (nonatomic ,strong) UILabel *yearForMonthLabel; //当前年份

@property (nonatomic ,copy)   buttonClickBlock clickBlock;

@end

@implementation LGWeekView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setCurrentYearMonth:(NSString *)currentYearMonth {
    _currentYearMonth = currentYearMonth;
    self.yearForMonthLabel.text = currentYearMonth;
}

- (void)selectNextOrLast:(buttonClickBlock)clickButtonBlock {
    self.clickBlock = clickButtonBlock;
}

- (void)setUp {
    [self addSubview:self.nextMonthButton];
    [self addSubview:self.lastMonthButton];
    [self addSubview:self.yearForMonthLabel];
    
    NSArray *arr = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    for (int i = 0 ; i < arr.count ; i ++) {
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor clearColor];
        label.text = arr[i];
        if (i == 0 || i == 6) {
            label.textColor = [UIColor lightGrayColor];
        } else {
            label.textColor = [UIColor blackColor];
        }
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label.tag = 1000 + i;
    }
}

- (void)buttonAction:(UIButton *)button {
    BOOL choose = NO;
    if (button.tag == 100) {
        choose = NO;
    } else {
        choose = YES;
    }
    self.clickBlock(choose);
}

- (UIButton *)lastMonthButton {
    if (!_lastMonthButton) {
        _lastMonthButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _lastMonthButton.frame = CGRectZero;
        [_lastMonthButton setImage:[UIImage imageNamed:@"calendarBackImage"] forState:UIControlStateNormal];
        [_lastMonthButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _lastMonthButton.tag = 100;
    }
    return _lastMonthButton;
}

- (UIButton *)nextMonthButton {
    if (!_nextMonthButton) {
        _nextMonthButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextMonthButton.frame = CGRectZero;
        [_nextMonthButton setImage:[UIImage imageNamed:@"calendarnextImage"] forState:UIControlStateNormal];
        [_nextMonthButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _nextMonthButton.tag = 101;
    }
    return _nextMonthButton;
}

- (UILabel *)yearForMonthLabel {
    if (!_yearForMonthLabel) {
        _yearForMonthLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _yearForMonthLabel.textColor = [UIColor blackColor];
        _yearForMonthLabel.font = [UIFont systemFontOfSize:16];
        _yearForMonthLabel.textAlignment = NSTextAlignmentCenter;
        _yearForMonthLabel.text = @"2017";
    }
    return _yearForMonthLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.lastMonthButton.frame = (CGRect){5.0f ,0.0f ,24 ,24};
    self.nextMonthButton.frame = (CGRect){CGRectGetWidth(self.frame) -  5.0f - 24.0 ,0.0f ,24 ,24};
    self.yearForMonthLabel.frame = (CGRect){CGRectGetMaxX(self.lastMonthButton.frame) ,5.0f ,CGRectGetWidth(self.frame) - CGRectGetWidth(self.lastMonthButton.frame) - CGRectGetWidth(self.nextMonthButton.frame) ,15.0f};
    for (int i = 0; i < 7; i ++) {
        UILabel *label = (UILabel *)[self viewWithTag:1000 + i];
        label.frame = (CGRect){i * (CGRectGetWidth(self.frame) / 7.0) ,CGRectGetHeight(self.frame) - 15.0 ,CGRectGetWidth(self.frame) / 7.0 ,15.0f};
    }
}
@end
