//
//  SafetyCheckViewController.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-18.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"

@interface SafetyCheckViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) UILabel *titleLab;
@end
