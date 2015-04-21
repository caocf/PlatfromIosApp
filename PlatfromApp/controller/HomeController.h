//
//  ViewController.h
//  ordero2o-platform
//
//  Created by mac on 15-4-14.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeController : UIViewController<UITableViewDataSource,UITabBarDelegate>{
 UITableView *dataTable;

 NSMutableArray * dataArray1;
 NSMutableArray * dataArray2;
 NSMutableArray * titleArray;

 UITableViewCell * mtableCell;
}

@property (nonatomic, strong) IBOutlet UITableViewCell *customCell;


@end

