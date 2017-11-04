//
//  LGCollectionView.m
//  Calendar
//
//  Created by 郭武将 on 2017/5/24.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "LGCollectionView.h"
#import "LGCalendarCell.h"
#import "LGCalendarModel.h"
#import "LGCalendarManager.h"

#define CurrentDayColor [UIColor redColor]

@interface LGCollectionView ()
<UICollectionViewDelegate ,UICollectionViewDataSource>

@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) NSArray *dataArray;


@end

@implementation LGCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)yearOfCollectionViewMonth:(NSInteger)month yearNumBlock:(yearNumBlock)block {
    _currentIndex = month;
    [[LGCalendarManager defaultManager]dayArrayWithMonth:month dayArrBlock:^(NSArray *arr){
        self.dataArray = arr;
        NSInteger index = ceil(arr.count / 2.0);
        LGDayModel *dayModel = arr[index];
        block(dayModel);
        [self.collectionView reloadData];
    }];
}
- (void)setUp {
    [self addSubview:self.collectionView];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat h = CGRectGetHeight(self.frame);
    self.collectionView.frame = CGRectMake(0, 0, w, h);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LGCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LGCalendarCellIdentifier forIndexPath:indexPath];
    LGDayModel *dayModel = self.dataArray[indexPath.row];
    cell.dayModel = dayModel;
    cell.isShowLunarCalendar = self.isShowChineseCalendar;
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LGCalendarCell *cell = (LGCalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
    for (LGCalendarCell *othersCell in collectionView.visibleCells) {
        if (CGColorEqualToColor(othersCell.backgroundColor.CGColor, CurrentDayColor.CGColor)) {
            othersCell.nomalDayLabel.textColor = [UIColor blackColor];
            othersCell.lunarCalendarLabel.textColor = [UIColor blackColor];
            othersCell.backgroundColor = [UIColor clearColor];
            break;
        };
    }
    cell.nomalDayLabel.textColor = [UIColor whiteColor];
    cell.lunarCalendarLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = CurrentDayColor;
    NSLog(@"%ld++%ld++%ld+++",(long)cell.dayModel.yearForMonth,(long)cell.dayModel.numForMonth,(long)cell.dayModel.currentDayInMonth);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger weeks = self.dataArray.count/7;
    CGFloat w = CGRectGetWidth(collectionView.bounds);
    CGFloat h = CGRectGetHeight(collectionView.bounds);
    return CGSizeMake(w/7.0, h/weeks);
    
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 0.0;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:NSClassFromString(@"LGCalendarCell") forCellWithReuseIdentifier:LGCalendarCellIdentifier];
    }
    return _collectionView;
}
@end
