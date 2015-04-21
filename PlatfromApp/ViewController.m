
#import "ViewController.h"
#import "HomeController.h"
#import "NMBottomTabBarController.h"


@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
 // [self]add

 [self addButton];
}

//初始化界面 ，添加按钮

-(void) addButton{
 self.title = @"second";



 UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 [button setBackgroundColor:[UIColor blackColor]];
 [button setFrame:CGRectMake(60, 60, 50, 30)];
 [button setTitle:@"click" forState:UIControlStateNormal];
 [button setTitle:@"ok" forState:UIControlStateSelected];
 [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];

 [self.view addSubview:button];

}

-(void) intentToMain{
 
 NMBottomTabBarController *tabBarController = [[NMBottomTabBarController alloc]init];


  [tabBarController selectTabAtIndex:0];


 [self presentViewController:tabBarController animated:YES completion:nil ];


}


-(void) buttonPressed{

	NSLog(@"WO BEI DIAN JI LE ");
 //实现代码跳转
// UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ButtonPressed"
//                                                message:@"You have pressed the button"
//                                               delegate:nil
//                                      cancelButtonTitle:@"Yesh"
//                                      otherButtonTitles: nil];
// [alert show];
  //HomeController *vc1=[[HomeController alloc] init];
 //[self.navigationController pushViewController:vc1 animated:YES];
 //[self presentViewController:vc1 animated:YES completion:nil ];

 [self intentToMain];

}
//
//iOS5 iOS6 用的都是presentViewController
//
//IOS 4 才是用 presentModalViewController
//
//if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]) {
// [self presentViewController:aSelect animated:YES completion:nil]; // ios 5 and 以上
//}else{
// [self presentModalViewController:aSelect animated:YES]; // ios 4 and  以下
//}



-(void)addListener: (UIButton *) mbt {
 // UITapGestureRecognizer * TapGesturRecognizer = [[UITapGestureRecognizer alloc]
 //                                                 initWithTarget:self action:@selector(tapGestureRecognizer)];
 //
 // [mbt addGestureRecognizer:TapGesturRecognizer ];
 [self addLongClickListener:mbt];
 [self.view addSubview:mbt];
}

-(void)addLongClickListener :(UIButton *) mbt{
 UILongPressGestureRecognizer * mlongPressGestre = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(actionLongClick)];
 mlongPressGestre.allowableMovement= NO;
 mlongPressGestre.minimumPressDuration =0.2;

 [mbt addGestureRecognizer:mlongPressGestre];
}

-(void)actionLongClick{
 NSLog(@"long click action");
}

- (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
}

@end