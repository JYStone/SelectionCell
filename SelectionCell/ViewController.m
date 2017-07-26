//
//  ViewController.m
//  SelectionCell
//
//  Created by 金靖媛 on 2017/7/26.
//  Copyright © 2017年 LY. All rights reserved.
//

#import "ViewController.h"
#import "ButtonSingleController.h"
#import "ButtonMulController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titleArr = [NSArray arrayWithObjects:@"Button 单选",@"Button 多选",@"TableView 单选",@"TableView 多选",@"CollectionView 单选",@"CollectionView 多选", nil];
    for (int i = 0; i < 6; i++) {
        UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
        myButton.frame = CGRectMake(75, 100+75*i, 225, 50);
        myButton.backgroundColor = [UIColor grayColor];
        myButton.tag = 100+i;
        [myButton setTitle:titleArr[i] forState:UIControlStateNormal];
        [myButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        myButton.layer.masksToBounds = YES;
        myButton.layer.cornerRadius = 5;
        [self.view addSubview:myButton];
    }
}

- (void)buttonClick:(UIButton *)sender
{
    if (sender.tag == 100) {
        ButtonSingleController *bsVC = [[ButtonSingleController alloc] init];
        bsVC.view.backgroundColor = [UIColor whiteColor];
        bsVC.title = sender.titleLabel.text;
        [self.navigationController pushViewController:bsVC animated:YES];
    }else if (sender.tag == 101) {
        ButtonMulController *muVC = [[ButtonMulController alloc] init];
        muVC.view.backgroundColor = [UIColor whiteColor];
        muVC.title = sender.titleLabel.text;
        [self.navigationController pushViewController:muVC animated:YES];
    }else if (sender.tag == 102) {
        ButtonSingleController *bsVC = [[ButtonSingleController alloc] init];
        [self.navigationController pushViewController:bsVC animated:YES];
    }else if (sender.tag == 103) {
        ButtonSingleController *bsVC = [[ButtonSingleController alloc] init];
        [self.navigationController pushViewController:bsVC animated:YES];
    }else if (sender.tag == 104) {
        ButtonSingleController *bsVC = [[ButtonSingleController alloc] init];
        [self.navigationController pushViewController:bsVC animated:YES];
    }else {
        ButtonSingleController *bsVC = [[ButtonSingleController alloc] init];
        [self.navigationController pushViewController:bsVC animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
