//
//  NIDropDown.m
//  NIDropDown
//
//  Created by Bijesh N on 12/28/12.
//  Copyright (c) 2012 Nitor Infotech. All rights reserved.
//

#import "NIDropDown.h"
#import "QuartzCore/QuartzCore.h"
#import "Macro.h"

@interface NIDropDown ()
@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) UIButton *btnSender;
@property(nonatomic, retain) NSArray *list;
@end

@implementation NIDropDown
@synthesize table;
@synthesize btnSender;
@synthesize list;
@synthesize delegate;

- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr:(NSInteger)tag:(NSMutableDictionary *)dict{
    self.btnSender = b;
    self = [super init];
    if (self) {
        
        // Initialization code
//        NSLog(@">>>>>>>>>>>>>tag:%ld",tag);
//        NSLog(@">>>>>>>>>>>>>dict:%@",dict);
        CGRect btn;
        if (IOS_7_8) {
           btn  = b.superview.frame;
        }if (IOS_8) {
            btn  = b.superview.frame;
        }
        
        self.backgroundColor = [UIColor redColor];
        
        NSLog(@">>>>>>>>>>btnSender.frame>>>>>>>%@",NSStringFromCGRect(b.frame));
        NSLog(@">>>>>>>>>>btnSender.superview.frame>>>>>>>%@",NSStringFromCGRect(b.superview.frame));
//        NSLog(@">>>>>>>>>>>>>btnSender.superview.superview.frame>>>>%@",NSStringFromCGRect(btnSender.superview.superview.frame));
//        NSLog(@">>>>>>>>>>>btnSender.superview.superview.superview.frame>>>>>>%@",NSStringFromCGRect(btnSender.superview.superview.superview.frame));

        
        self.frame = CGRectMake(60, btn.origin.y+40, 190, 0);
        self.list = [NSArray arrayWithArray:arr];
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.backgroundColor = [UIColor clearColor];
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(60, btn.origin.y+40, 190, *height);
            table.frame = CGRectMake(0, 0, self.frame.size.width, *height);
        }];
        if (IOS_7_8) {
            [b.superview.superview addSubview:self];
            [b.superview.superview bringSubviewToFront:self];
            NSLog(@">>>>>>>>>>btnSender.superview>>>>>>>%@",NSStringFromClass([btnSender.superview class]));
            NSLog(@">>>>>>>>>>>>>btnSender.superview.superview>>>>%@",NSStringFromClass([btnSender.superview.superview class]));
    
        }else {
            [b.superview.superview addSubview:self];
            [b.superview.superview bringSubviewToFront:self];
            NSLog(@">>>>>>>>>>btnSender.superview>>>>>>>%@",NSStringFromClass([btnSender.superview class]));
            NSLog(@">>>>>>>>>>>>>btnSender.superview.superview>>>>%@",NSStringFromClass([btnSender.superview.superview class]));
        }
       
        [self addSubview:table];
    }
    return self;
}

-(void)hideDropDown:(UIButton *)b {
//    CGRect btn = b.superview.superview.superview.superview.frame;
    CGRect btn;
    if (IOS_7_8) {
        btn  = b.superview.frame;
    }if (IOS_8) {
        btn  = b.superview.frame;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(60, btn.origin.y+40, 190, 0);
        table.frame = CGRectMake(0, 0, self.frame.size.width, 0);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
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
    [self hideDropDown:btnSender];
//    [btnSender setTitle:[self.list objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [self myDelegate];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"dianjile" object:@(indexPath.row)];
}

- (void) myDelegate {
    if ([self.delegate respondsToSelector:@selector(niDropDownDelegateMethod:)]) {
       [self.delegate niDropDownDelegateMethod:self];
    }
    
}


@end
