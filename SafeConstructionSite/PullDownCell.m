//
//  PullDownCell.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "PullDownCell.h"

@implementation PullDownCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"PullDownCell" owner:self options:nil] objectAtIndex:0];
        //        self.label.backgroundColor = [UIColor redColor];
        //        self.label.text = @"项目检查";
        
        CALayer *layer = self.scoreBtn.layer;
        [layer setBorderWidth:1.0f];
        [layer setBorderColor:[UIColor grayColor].CGColor];
        
        layer = self.numBtn.layer;
        [layer setBorderWidth:1.0f];
        [layer setBorderColor:[UIColor grayColor].CGColor];
        
        layer = self.rankBtn.layer;
        [layer setBorderWidth:1.0f];
        [layer setBorderColor:[UIColor grayColor].CGColor];
        
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)pullDownClick:(UIButton *)sender {
    NSLog(@">>>>>>>>>点击了");
    NSArray * arr = [[NSArray alloc] init];
    if (sender.tag == 100) {
         arr = [NSArray arrayWithObjects:@"1分", @"2分", @"3分", @"4分", @"5分",@"6分",nil];
    }else if (sender.tag == 101){
        arr = [NSArray arrayWithObjects:@"1次", @"2次", @"3次", @"4次", @"5次",@"6次",nil];
    }else if (sender.tag == 102){
        arr = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E",@"F",nil];
    }
   
    if(self.evaluatDownView == nil) {
        CGFloat f = 200;
        self.evaluatDownView = [[EvaluatDownVIew alloc] showDropDown:sender :&f :arr :sender.tag:nil];
    }
    else {
        [self.evaluatDownView hideDropDown:sender];
        [self release2];
    }
}

-(void)release2{
    self.evaluatDownView = nil;
}

@end
