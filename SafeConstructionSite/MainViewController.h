//
//  MainViewController.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-14.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MainViewControllerDelegate <NSObject>
- (void) initTitleStr: (NSString *) title;
@end
@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, copy) NSString *projectTitle;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) id<MainViewControllerDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *titleArray;
@end
