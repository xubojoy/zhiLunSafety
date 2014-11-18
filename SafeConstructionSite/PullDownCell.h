//
//  PullDownCell.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
@interface PullDownCell : UITableViewCell
{
    NIDropDown *dropDown;
}
- (IBAction)pullDownClick:(UIButton *)sender;

@end
