//
//  SafetyCheckCell.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
@interface SafetyCheckCell : UITableViewCell<NIDropDownDelegate>
{
    NIDropDown *dropDown;
}
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *scoreLab;
@property (weak, nonatomic) IBOutlet UIButton *scoreBtn;
@property (nonatomic, strong) NIDropDown *scoreView;
- (IBAction)scoreBtnClick:(UIButton *)sender;
-(void)rel;
@end
