//
//  MDViewController.m
//  MDMVVM
//
//  Created by leon0206 on 10/30/2019.
//  Copyright (c) 2019 leon0206. All rights reserved.
//

#import "MDViewController.h"

@interface MDViewController ()
@property (nonatomic, strong) UIView *firstLabelBgView;
@property (nonatomic, strong) UILabel *firstLabel;
@end

@implementation MDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    {
        self.firstLabelBgView = [[UIView alloc]initWithFrame:CGRectMake(30, 100, 200, 30)];
        self.firstLabelBgView.backgroundColor =  [UIColor greenColor];
        self.firstLabel = [UILabel new];
        self.firstLabel.text = @"点击进入MVC测试页面";
        self.firstLabel.font = [UIFont systemFontOfSize:13.0];
        self.firstLabel.textAlignment = NSTextAlignmentCenter;
        self.firstLabel.backgroundColor = [UIColor clearColor];
        [self.firstLabel sizeToFit];
        self.firstLabel.frame = CGRectMake(0, 0, 200, 30);
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked1:)];
        [self.firstLabelBgView addGestureRecognizer:tap1];
        [self.firstLabelBgView addSubview:self.firstLabel];
        [self.view addSubview:self.firstLabelBgView];
    }
    {
          self.firstLabelBgView = [[UIView alloc]initWithFrame:CGRectMake(30, 200, 200, 30)];
          self.firstLabelBgView.backgroundColor =  [UIColor greenColor];
          self.firstLabel = [UILabel new];
          self.firstLabel.text = @"点击进入MVVM测试页面";
          self.firstLabel.font = [UIFont systemFontOfSize:13.0];
          self.firstLabel.textAlignment = NSTextAlignmentCenter;
          self.firstLabel.backgroundColor = [UIColor clearColor];
          [self.firstLabel sizeToFit];
          self.firstLabel.frame = CGRectMake(0, 0, 200, 30);
          UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked1:)];
          [self.firstLabelBgView addGestureRecognizer:tap1];
          [self.firstLabelBgView addSubview:self.firstLabel];
          [self.view addSubview:self.firstLabelBgView];
      }
}

- (void)tapClicked1:(UITapGestureRecognizer *)tap
{
    UIViewController *vc = [NSClassFromString(@"MDMVCViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)tapClicked2:(UITapGestureRecognizer *)tap
{
    UIViewController *vc = [NSClassFromString(@"MDMVVMViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
