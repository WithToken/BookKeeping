//
//  MMBDateCell.m
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/11/3.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "MMBDateCell.h"

@interface MMBDateCell ()
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
- (IBAction)selectDateClick:(id)sender;

@end


@implementation MMBDateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)selectDateClick:(id)sender {
}
@end
