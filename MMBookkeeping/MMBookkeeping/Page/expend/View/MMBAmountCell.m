//
//  MMBAmountCell.m
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/11/3.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "MMBAmountCell.h"

@interface MMBAmountCell ()

@property (weak, nonatomic) IBOutlet UIButton *currencyBtn;

@property (weak, nonatomic) IBOutlet UILabel *coinLabel;

- (IBAction)currencyClick:(id)sender;

@end

@implementation MMBAmountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)currencyClick:(id)sender {
}
@end
