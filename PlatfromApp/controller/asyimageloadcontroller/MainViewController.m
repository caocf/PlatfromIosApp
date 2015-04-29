//
//  MainViewController.m
//  RTImageLoader
//
//  Created by Ryan Tang on 13-7-7.
//  Copyright (c) 2013年 Ericsson Labs. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    label.center = CGPointMake(160, 50);
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.text = @"By Ryan.Tang";
    [self.view addSubview:label];
    
    UIButton *btn_tableView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn_tableView.frame = CGRectMake(0, 0, 250, 40);
    btn_tableView.center = CGPointMake(160, 120);
    [btn_tableView setTitle:@"UITableView" forState:UIControlStateNormal];
    [btn_tableView addTarget:self action:@selector(tableViewClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_tableView];
}

//UITableView列表显示事件
-(void)tableViewClicked
{
    TableViewController *tableViewCtrl = [[TableViewController alloc] init];
    tableViewCtrl.navigationItem.title = @"UITableView";

    [self.navigationController pushViewController:tableViewCtrl animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
