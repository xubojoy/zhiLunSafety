//
//  SafetyCheckCell.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "SafetyCheckCell.h"

@implementation SafetyCheckCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
          self = [[[NSBundle mainBundle]loadNibNamed:@"SafetyCheckCell" owner:self options:nil] objectAtIndex:0];
//        self.label.backgroundColor = [UIColor redColor];
        self.label.text = @"项目检查";
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
