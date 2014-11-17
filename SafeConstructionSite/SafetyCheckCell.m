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
//        self.label.text = @"项目检查";
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

- (IBAction)scoreBtnClick:(UIButton *)sender {
    NSLog(@">>>>>>>>>点击了");
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"1分", @"2分", @"3分", @"4分", @"5分",nil];
    if(dropDown == nil) {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc] showDropDown:sender :&f :arr :sender.tag];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

-(void)rel{
    dropDown = nil;
}

-(void)niDropDownDelegateMethod:(NIDropDown *)sender{


}


@end
