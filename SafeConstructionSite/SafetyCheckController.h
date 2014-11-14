//
//  NextViewController.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface SafetyCheckController : UIViewController<UITableViewDataSource, UITableViewDelegate,NIDropDownDelegate>
{
    NIDropDown *dropDown;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NIDropDown *scoreView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *safetyCheckArr;
@property (nonatomic, strong) NSMutableArray *introArr;
-(void)rel;
-(instancetype)initWithTitle:(NSString *)title;
@end
