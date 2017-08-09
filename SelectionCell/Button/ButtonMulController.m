//
//  ButtonMulController.m
//  SelectionCell
//
//  Created by 金靖媛 on 2017/7/26.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "ButtonMulController.h"

@interface ButtonMulController ()
@property (nonatomic,strong) NSMutableArray *selBtnArr;
@end

@implementation ButtonMulController

- (NSMutableArray *)selBtnArr
{
    if (!_selBtnArr) {
        _selBtnArr = [NSMutableArray array];
    }
    return _selBtnArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [btn setTitle:[NSString stringWithFormat:@"%d ll", i + (3 * j) + 1] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.tag = (i + (3 * j) + 1) + 100;
            [btn addTarget:self action:@selector(clickedBtnWith:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = CGRectMake(20+i*120, 100+j*60, 100, 40);
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            [self.view addSubview:btn];
        }
    }

}
- (void)clickedBtnWith:(UIButton *)sender{
    
    //多选 记录状态 可以取消
    if (!sender.selected) {
        sender.layer.borderColor = [UIColor orangeColor].CGColor;
        [self.selBtnArr addObject:[NSNumber numberWithInteger:sender.tag - 100]];
    }else{
        sender.layer.borderColor = [UIColor lightGrayColor].CGColor;
        if ([self.selBtnArr containsObject:[NSNumber numberWithInteger:sender.tag - 100]]) {
            [self.selBtnArr removeObject:[NSNumber numberWithInteger:sender.tag - 100]];
        }
    }
    sender.selected = !sender.selected;
    NSLog(@"%@", self.selBtnArr.description);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
