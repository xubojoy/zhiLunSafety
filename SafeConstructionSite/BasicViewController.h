//
//  BasicViewController.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-18.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "ComboBoxView.h"
@interface BasicViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    ComboBoxView *dropDown;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *departmentStr;;

@end
