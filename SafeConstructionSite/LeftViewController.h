//
//  ViewController.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
@interface LeftViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,NIDropDownDelegate>
{
    NIDropDown *dropDown;
}


@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *departmentLabel;
@property (nonatomic, strong) UIImageView *userImageView;
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *projectArray;
@property (nonatomic, strong) NIDropDown *scoreView;

@property (nonatomic, strong) UITextField *nameText;
@property (nonatomic, strong) UIButton *loginBtn;
@end
