//
//  NIDropDown.h
//  NIDropDown
//
//  Created by Bijesh N on 12/28/12.
//  Copyright (c) 2012 Nitor Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NIDropDown;
@protocol NIDropDownDelegate <NSObject>
- (void) niDropDownDelegateMethod: (NIDropDown *) sender;
@end

@interface NIDropDown : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) id <NIDropDownDelegate> delegate;
@property (nonatomic, assign) NSInteger titleCount;
@property (nonatomic, strong) NSMutableDictionary *dict;

-(void)hideDropDown:(UIButton *)b;
- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr:(NSInteger)tag:(NSMutableDictionary *)dict;
@end
