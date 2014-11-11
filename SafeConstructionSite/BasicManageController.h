//
//  BasicManageController.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicManageController : UIViewController
@property (nonatomic, copy) NSString *title;

-(instancetype)initWithTitle:(NSString *)title;
@end
