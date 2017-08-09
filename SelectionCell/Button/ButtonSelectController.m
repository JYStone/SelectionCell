//
//  ButtonSelectController.m
//  SelectionCell
//
//  Created by 金靖媛 on 2017/8/9.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "ButtonSelectController.h"
#define MAXCOUNT 5
@interface ButtonSelectController ()
@property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,strong) NSMutableArray *selectedArr;
@end

@implementation ButtonSelectController

- (NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25", nil];
    }
    return _data;
}

- (NSMutableArray *)selectedArr
{
    if (!_selectedArr) {
        _selectedArr = [NSMutableArray array];
    }
    return _selectedArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0 ; i<5; i++) {
        for (int j = 0 ; j<5; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(25+65*j, 100+40*i, 60, 30);
            [button setTitle:self.data[5*i+j] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            button.layer.masksToBounds = YES;
            button.layer.borderColor = [UIColor orangeColor].CGColor;
            button.layer.borderWidth = 1;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 5*i+j+1;
            [self.view addSubview:button];
            
        }
    }
}

- (void)buttonClick:(UIButton *)sender
{
    if (!sender.selected) {
        if (self.selectedArr.count < MAXCOUNT) {
            [sender setBackgroundColor:[UIColor orangeColor]];
            [self.selectedArr addObject:[NSString stringWithFormat:@"%ld",sender.tag]];
        }else {
            NSString *indexStr = [self.selectedArr firstObject];
            NSInteger index = [indexStr integerValue];
            UIButton *btn = (UIButton *)[self.view viewWithTag:index];
            [btn setBackgroundColor:[UIColor whiteColor]];
            btn.selected = NO;
            [self.selectedArr removeObject:[NSString stringWithFormat:@"%ld",btn.tag]];
            [sender setBackgroundColor:[UIColor orangeColor]];
            [self.selectedArr addObject:[NSString stringWithFormat:@"%ld",sender.tag]];
        }
    }else {
        if ([self.selectedArr containsObject:[NSString stringWithFormat:@"%ld",sender.tag]]) {
            [sender setBackgroundColor:[UIColor whiteColor]];
            [self.selectedArr removeObject:[NSString stringWithFormat:@"%ld",sender.tag]];
        }
    }
    sender.selected = !sender.selected;
}


@end
