//
//  CityCell.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-20.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "CityCell.h"

@implementation CityCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"CityCell" owner:self options:nil] objectAtIndex:0];
        
        CALayer *layer = self.commonBtn.layer;
        [layer setBorderWidth:1.0f];
        [layer setBorderColor:[UIColor grayColor].CGColor];
    }
    return self;
}

- (IBAction)selectBtnClick:(UIButton *)sender {
    NSArray * arr = [[NSArray alloc] init];
    if (sender.tag == 999) {
         arr = [NSArray arrayWithObjects:@"北京市", @"上海市", @"广东省", @"深圳市", @"河南省",@"河北省",nil];
    }else if (sender.tag == 900){
        arr = [NSArray arrayWithObjects:@"50分", @"60分", @"70分", @"80分", @"90分",@"100分",nil];
    }
   
    if(self.pullDown == nil) {
        CGFloat f = 200;
        self.pullDown = [[ComboBoxView alloc] showDropDown:sender :&f :arr :sender.tag :nil];
    }
    else {
        [self.pullDown hideDropDown:sender];
        [self real1];
    }
}

-(void)real1{
    self.pullDown = nil;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
