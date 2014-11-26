//
//  TestPullView.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-21.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestPullView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) UIButton *btnSender;
@property(nonatomic, retain) NSArray *list;

-(void)hideDropDown:(UIButton *)b;
-(instancetype)initWithFrame:(CGRect)frame showDropDown:(UIButton *)b;

- (void)showDropDownheight:(CGFloat)height dataArray:(NSArray *)arr btnTag:(NSInteger)tag dict:(NSMutableDictionary *)dict;

@end
