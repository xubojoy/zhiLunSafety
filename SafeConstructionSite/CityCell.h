//
//  CityCell.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-20.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboBoxView.h"
#import "TestPullView.h"
#import "LMContainsLMComboxScrollView.h"
#import "LMComBoxView.h"
@interface CityCell : UITableViewCell<LMComBoxViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIButton *commonBtn;
@property (nonatomic, strong) ComboBoxView *pullDown;
@property (nonatomic, strong) TestPullView *testPullView;
@property (nonatomic, strong) LMContainsLMComboxScrollView *bgScrollView;
@end
