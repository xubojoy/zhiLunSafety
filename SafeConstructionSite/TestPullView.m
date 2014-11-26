//
//  TestPullView.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-21.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "TestPullView.h"
#import "Macro.h"
@implementation TestPullView

-(instancetype)initWithFrame:(CGRect)frame showDropDown:(UIButton *)b{
    self = [super init];
    if (self) {
        
//        CGRect btn;
//        if (IOS_7_8) {
//            btn = self.btnSender.superview.superview.superview.frame;
//        }else if ([[UIDevice currentDevice] systemVersion].floatValue > 8){
//            btn = self.btnSender.superview.superview.frame;
//        }
        self.backgroundColor = [UIColor redColor];
//        self.frame = CGRectMake(self.btnSender.frame.origin.x-50, btn.origin.y+btn.size.height, 100, 0);
        self.btnSender = b;
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.tableView];
        
    }
    return self;
}

-(void)hideDropDown:(UIButton *)b {
    NSLog(@">>>>>>>>>>>>关闭啦！！！！！");
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(b.frame.origin.x, b.frame.origin.y+self.btnSender.frame.size.height, self.frame.size.width, 0);
        self.table.frame = CGRectMake(0, 0, self.frame.size.width, 0);
    }];
}


-(void)showDropDownheight:(CGFloat)height dataArray:(NSArray *)arr btnTag:(NSInteger)tag dict:(NSMutableDictionary *)dict{
    NSLog(@">>>>>>>>lallllllalalalalalalal>>>");
    self.list = [NSArray arrayWithArray:arr];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(self.btnSender.frame.origin.x, self.btnSender.frame.origin.y+self.btnSender.frame.size.height, self.frame.size.width, height);
        self.tableView.frame = CGRectMake(0, 0, self.frame.size.width, height);
    }];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.list.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    cell.textLabel.text =[self.list objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.textColor = [UIColor blackColor];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, self.frame.size.width, 0.5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:view];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self hideDropDown:self.btnSender];
    [self.btnSender setTitle:[self.list objectAtIndex:indexPath.row] forState:UIControlStateNormal];
//    [self myDelegate];
}
//- (void) myDelegate {
//    if ([self.delegate respondsToSelector:@selector(EvaluatDownVIewDelegateMethod:)]) {
//        [self.delegate EvaluatDownVIewDelegateMethod:self];
//    }
//    
//}

@end
