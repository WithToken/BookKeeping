//
//  MMBTagCell.m
//  MMBookkeeping
//
//  Created by 郭武将 on 2017/11/3.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "MMBTagCell.h"

@interface MMBTagCell ()
@property (weak, nonatomic) IBOutlet UITextField *tagTextField;

@end

@implementation MMBTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
