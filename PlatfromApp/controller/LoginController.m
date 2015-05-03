//
//  LoginController.m
//  PlatfromApp
//
//  Created by mac on 15-4-22.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import "LoginController.h"
#import "DecodePlatFormResultProtocol.h"
#import "GMDCircleLoader.h"
#import "HttpUtils.h"
#import  "JsonUploadData.h"
#import "NMBottomTabBarController.h"
#import "RegisterController.h"



@interface LoginController () <DecodePlatFormResultProtocol>{


}

@end

//用于实现
@implementation LoginController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    // Do any additional setup after loading the view.
 self.title = @"登录";
 [self.mLoginBt addTarget:self action:@selector(actionLogin) forControlEvents:UIControlEventTouchUpInside];
   [self.mRegisterBt addTarget:self action:@selector(actionRegister) forControlEvents:UIControlEventTouchUpInside];
    


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)actionLogin{
    
    NSString * mAccount  = self.maccount.text;
    NSString * mPassword = self.mpassword.text;
[GMDCircleLoader setOnView:self.view withTitle:@"Loading..." animated:YES];
 [HttpUtils sendData:[JsonUploadData getLoginUploadJson:mAccount:mPassword] protocal:self];

}



-(void)actionRegister{
    RegisterController * mRegisterController = [[RegisterController alloc]initWithNibName:@"register" bundle:nil];
    [self.navigationController pushViewController:mRegisterController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) onDecoded :(NSString *)reason : (Boolean) misSuccess :(NSDictionary * ) mResultDictionary{
 [GMDCircleLoader hideFromView:self.view animated:YES];
  //弹出登录成功的提示
    //[self sho]
    
    NMBottomTabBarController * mBottomBar =[[NMBottomTabBarController alloc]init];
    [self.navigationController pushViewController:mBottomBar animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
