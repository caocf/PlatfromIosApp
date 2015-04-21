//
//  ViewController.m
//  ordero2o-platform
//
//  Created by mac on 15-4-14.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import "HomeController.h"
#import "MyCustromCell.h"

@interface HomeController ()
// 放在这边算是私有的变量
//放在头文件里的就是共享的了
@end


//只有 m 文件里面有
@implementation HomeController



- (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.

 UIView * mUiBody = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
 mUiBody.backgroundColor = [UIColor lightTextColor];
 self.view = mUiBody;

 dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 , 320, 420)];
 [dataTable setDelegate:self];
 [dataTable setDataSource:self];
 [self.view addSubview:dataTable];




 
}

- (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 static NSString * simpleIdentify = @"good";
 MyCustromCell * mCell = [tableView dequeueReusableCellWithIdentifier:simpleIdentify];
 if(!mCell){
  [tableView registerNib:[UINib nibWithNibName:@"item_view" bundle:nil] forCellReuseIdentifier:simpleIdentify];
  mCell = [tableView dequeueReusableCellWithIdentifier:simpleIdentify];
   }
 [mCell.mUIButton setTitle:@"zhujohnle" forState:UIControlStateNormal];




 return mCell;

}



//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
// //特别说明：使用self 调用后面的方法 和 直接使用 [tableView cellForRowAtIndexPath:indexPa	th]调用是不一样的结果的.
// UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
// return cell.frame.size.height;
//}

@end
