//
//  NextViewController.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "SafetyCheckController.h"
#import "SafetyCheckCell.h"

@interface SafetyCheckController ()

@end

@implementation SafetyCheckController

-(instancetype)initWithTitle:(NSString *)title{
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.safetyCheckArr = [NSMutableArray new];
    self.introArr = [NSMutableArray new];
    [self loadData];
    
}

-(void)loadData{

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"SafetyCheck.plist" withExtension:nil];
//    NSArray *tempArray = [NSArray arrayWithContentsOfURL:url];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfURL:url];
    NSLog(@">>>>>>>>>>>>>%@",dic);
    self.safetyCheckArr = [dic objectForKey:@"safetyCheck"];
    NSLog(@">>>>>>>>self.introArr >>>>>%ld",self.safetyCheckArr.count);
    for (NSDictionary *detailDic in self.safetyCheckArr) {
        [self.introArr addObject:[detailDic objectForKey:@"intro"]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.introArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    SafetyCheckCell *cell = [[SafetyCheckCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.label.text = [self.introArr objectAtIndex:indexPath.row];

    return cell;
}


@end
