//
//  MainViewController.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-14.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "NIDropDown.h"
#import "ComboBoxView.h"
#import "PullDownView.h"
#import "EvaluatDownVIew.h"

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NIDropDown *dropDown;
}
@property (nonatomic, assign) int i;
@property (nonatomic, copy) NSString *projectTitle;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) UILabel *choseTime;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) ComboBoxView *pullDown;
@property (nonatomic, strong) PullDownView *pullDownView;


@property (strong, nonatomic) IBOutlet UIView *chooseTimeModalView;


@property (strong, nonatomic) IBOutlet UIView *maskView;


@property (weak, nonatomic) IBOutlet UIDatePicker *scheduleTimePicker;

- (IBAction)cancelChooseTime:(id)sender;

- (IBAction)confirmChooseTime:(id)sender;


@end
