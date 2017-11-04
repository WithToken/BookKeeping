//
//  AddExpendViewController.m
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/10/30.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "AddExpendViewController.h"
#import "MMBBaseViewController.h"
#import "UIBarButtonItem+MMBExtension.h"

#import "MMBDefaultHeader.h"

#import "MMBAmountCell.h"
#import "MMBDateCell.h"
#import "MMBTagCell.h"

typedef NS_ENUM(NSInteger,MyTableCellType){
    MyTableCellTypeAmount = 0,
    MyTableCellTypeDate   = 1,
    MyTableCellTypeTag    = 2,
};

@interface AddExpendViewController () <UITableViewDelegate ,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) MMBAmountCell *amountCell;
@property (nonatomic, strong) MMBDateCell *dateCell;
@property (nonatomic, strong) MMBTagCell *tagCell;

@end

@implementation AddExpendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBatItem];
    
    //self.myTableView.estimatedRowHeight = 50;
    //self.myTableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.myTableView registerNib:[UINib nibWithNibName:MMBAmountCellIdentifier bundle:nil] forCellReuseIdentifier:MMBAmountCellIdentifier];
    [self.myTableView registerNib:[UINib nibWithNibName:MMBDateCelllIdentifier bundle:nil] forCellReuseIdentifier:MMBDateCelllIdentifier];
    [self.myTableView registerNib:[UINib nibWithNibName:MMBTagCellIdentifier bundle:nil] forCellReuseIdentifier:MMBTagCellIdentifier];
}

- (MMBTagCell *)tagCell {
    if (!_tagCell) {
        _tagCell = [[NSBundle mainBundle] loadNibNamed:MMBTagCellIdentifier owner:self options:nil].firstObject;
    }
    return _tagCell;
}

- (MMBDateCell *)dateCell {
    if (!_dateCell) {
        _dateCell = [[NSBundle mainBundle] loadNibNamed:MMBDateCelllIdentifier owner:self options:nil].firstObject;
    }
    return _dateCell;
}

- (MMBAmountCell *)amountCell {
    if (!_amountCell) {
        _amountCell = [[NSBundle mainBundle] loadNibNamed:MMBAmountCellIdentifier owner:self options:nil].firstObject;
    }
    return _amountCell;
}

- (void)setBatItem {
    UIBarButtonItem *leftItem = [UIBarButtonItem mmb_barButtonItemWithTitle:@"取消"
                                                                 titleColor:[UIColor greenColor]
                                                                  titleFont:kFont(18)
                                                                     target:self
                                                                     action:@selector(cancelButtonClick)];
    
    UIBarButtonItem *rightItem = [UIBarButtonItem mmb_barButtonItemWithTitle:@"存储"
                                                                  titleColor:[UIColor greenColor]
                                                                   titleFont:kFont(18)
                                                                      target:self
                                                                      action:@selector(saveButtonClick)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.title = @"添加支出";
}

- (void)cancelButtonClick {
    [self dismiss];
}

- (void)saveButtonClick {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == MyTableCellTypeAmount) {
        return [self.amountCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    } else if (indexPath.row == MyTableCellTypeDate){
        NSLog(@"%f",[self.dateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height);
       return [self.dateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    } else if (indexPath.row == MyTableCellTypeTag) {
        return 43 + 1;
    } else{
        return CGFLOAT_MIN;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == MyTableCellTypeAmount) {
        MMBAmountCell *amount_cell = [tableView dequeueReusableCellWithIdentifier:MMBAmountCellIdentifier forIndexPath:indexPath];
        return amount_cell;
    } else if (indexPath.row == MyTableCellTypeDate) {
        MMBDateCell *date_cell = [tableView dequeueReusableCellWithIdentifier:MMBDateCelllIdentifier forIndexPath:indexPath];
        return date_cell;
    } else if (indexPath.row == MyTableCellTypeTag) {
        MMBTagCell *tag_cell = [tableView dequeueReusableCellWithIdentifier:MMBTagCellIdentifier forIndexPath:indexPath];
        return tag_cell;
    } else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
