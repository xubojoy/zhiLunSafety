//
//  CityCell.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-20.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboBoxView.h"
@interface CityCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIButton *commonBtn;
@property (nonatomic, strong) ComboBoxView *pullDown;
@end
