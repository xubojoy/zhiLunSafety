//
//  ViewController.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
#import "MainViewController.h"
@interface LeftViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,MainViewControllerDelegate>
{
    NIDropDown *dropDown;
}
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *departmentLabel;
@property (nonatomic, strong) UIImageView *userImageView;
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *projectArray;
@property (nonatomic, strong) NIDropDown *scoreView;
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic, strong) NSMutableArray *smallArray;
@property (nonatomic, strong) NSMutableArray *grouparr0;
@property (nonatomic, strong) NSMutableArray *grouparr1;
@property (nonatomic, strong) NSMutableArray *grouparr2;
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) MainViewController *mvc;
@property (nonatomic, assign) NSInteger sectionIndex;
@property (nonatomic, assign) int selectRow;




@property (nonatomic, strong) UITextField *nameText;
@property (nonatomic, strong) UIButton *loginBtn;
@end

