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

- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr {
    btnSender = b;
    self = [super init];
    if (self) {
        // Initialization code
        
        CGRect btn = b.superview.superview.frame;
        
        self.frame = CGRectMake(230, btn.origin.y+btn.size.height, 100, 0);
        self.list = [NSArray arrayWithArray:arr];
//        self.layer.masksToBounds = NO;
//        self.layer.cornerRadius = 8;
//        self.layer.shadowOffset = CGSizeMake(-5, 5);
//        self.layer.shadowRadius = 5;
//        self.layer.shadowOpacity = 0.5;
        self.backgroundColor = [UIColor whiteColor];
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
//        table.layer.cornerRadius = 5;
//        table.backgroundColor = [UIColor colorWithRed:0.239 green:0.239 blue:0.239 alpha:1];
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
//        table.separatorColor = [UIColor grayColor];
    
        
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(230, btn.origin.y+btn.size.height, 100, *height);
            table.frame = CGRectMake(0, 0, self.frame.size.width, *height);
        }];
        if (IOS_7) {
            [b.superview.superview.superview addSubview:self];
        }else if (IOS_8){
            [b.superview.superview addSubview:self];
        }
       
        [self addSubview:table];
    }
    return self;
}

-(void)hideDropDown:(UIButton *)b {
    CGRect btn = b.superview.superview.frame;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(230, btn.origin.y+btn.size.height, 100, 0);
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
    cell.textLabel.text =[list objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, self.frame.size.width, 0.5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:view];
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self hideDropDown:btnSender];
    UITableViewCell *c = [tableView cellForRowAtIndexPath:indexPath];
    [btnSender setTitle:c.textLabel.text forState:UIControlStateNormal];
    [self myDelegate];
}

- (void) myDelegate {
    if ([self.delegate respondsToSelector:@selector(niDropDownDelegateMethod:)]) {
       [self.delegate niDropDownDelegateMethod:self];
    }
    
}


@end
