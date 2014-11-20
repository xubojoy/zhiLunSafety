//
//  ScoreAndRankCell.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-20.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullDownView.h"
@interface ScoreAndRankCell : UITableViewCell
@property (nonatomic, strong) PullDownView *pullDownView;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UIButton *scoreBtn;

@property (weak, nonatomic) IBOutlet UIButton *rankBtn;

@end
