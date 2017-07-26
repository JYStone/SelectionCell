//
//  ButtonSingleController.m
//  SelectionCell
//
//  Created by 金靖媛 on 2017/7/26.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "ButtonSingleController.h"

@interface ButtonSingleController ()
@property (nonatomic,strong) NSMutableArray *muBtnArr;
@end

@implementation ButtonSingleController

- (NSMutableArray *)muBtnArr
{
    if (!_muBtnArr) {
        _muBtnArr = [NSMutableArray array];
    }
    return _muBtnArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [btn setTitle:[NSString stringWithFormat:@"%d", i + (3 * j) + 1] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.tag = i+(3*j) + 100;
            [btn addTarget:self action:@selector(clickedBtnWith:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = CGRectMake(20+i*120, 100+j*60, 100, 40);
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            [self.view addSubview:btn];
        }
    }
    
}
- (void)clickedBtnWith:(UIButton *)sender{
    
    //单选
    for (int i = 0; i<9; i++) {
        UIButton *button = (UIButton *)[self.view viewWithTag:100+i];
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    sender.layer.borderColor = [UIColor orangeColor].CGColor;
}

@end
