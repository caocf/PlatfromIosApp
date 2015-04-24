//
//  ViewController.m
//  NMBottomTabBarExample
//
//  Created by Prianka Liz Kariat on 04/12/14.
//  Copyright (c) 2014 Prianka Liz. All rights reserved.
//

#import "NMBottomTabBarController.h"
#import "GMDCircleLoader.h"

@interface NMBottomTabBarController ()

@end

@implementation NMBottomTabBarController
@synthesize controllers = _controllers;

//awakefromnib  可能默认会走这个方法注意
-(void)awake{



    self.tabBar = [NMBottomTabBar new];
    selectedIndex = -1;
    self.controllers = [NSArray new];
    [self.view addSubview:self.tabBar];
    
    containerView = [UIView new];
    [self.view addSubview:containerView];
    
    [self setUpConstraintsForContainerView];
    [self setUpConstraintsForTabBar];
    
    [self.tabBar setDelegate:self];
    
//
//// //创建一个导航栏
// UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 380, 44)];
//
// //创建一个导航栏集合
// UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:nil];
//
// //创建一个左边按钮
// UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"左边"
//                                                                style:UIBarButtonItemStyleBordered
//                                                               target:self
//                                                               action:@selector(clickLeftButton)];
//
// //创建一个右边按钮
// UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右边"
//                                                                 style:UIBarButtonItemStyleDone
//                                                                target:self
//                                                                action:@selector(clickRightButton)];
// //设置导航栏内容
// [navigationItem setTitle:@"模特平台"];
//
//
// //把导航栏集合添加入导航栏中，设置动画关闭
// [navigationBar pushNavigationItem:navigationItem animated:NO];
//
// //把左右两个按钮添加入导航栏集合中
// [navigationItem setLeftBarButtonItem:leftButton];
// [navigationItem setRightBarButtonItem:rightButton];
//// 把导航栏添加到视图中
// [self.view addSubview:navigationBar];
    self.title = @"模特平台";


}
-(void)clickLeftButton
{

 [self showDialog:@"点击了导航栏左边按钮"];

}


-(void)clickRightButton
{

 [self showDialog:@"点击了导航栏右边按钮"];

}


-(void)showDialog:(NSString *) str
{

 UIAlertView * alert= [[UIAlertView alloc] initWithTitle:@"这是一个对话框" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];

 [alert show];

}

- (void)viewDidUnload
{
 [super viewDidUnload];
 // Release any retained subviews of the main view.
 // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)setControllers:(NSArray *)controllers{

    _controllers = controllers;
     [self.tabBar layoutTabWihNumberOfButtons:self.controllers.count];

}
- (void)stopCircleLoader {
 [GMDCircleLoader hideFromView:self.view animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  [self awake];

 UIViewController *oneController = [UIViewController new];
 oneController.view.backgroundColor = [UIColor greenColor];
 UIViewController *twoController = [UIViewController new];
 twoController.view.backgroundColor = [UIColor blueColor];
 UIViewController *threeController = [UIViewController new];
 threeController.view.backgroundColor = [UIColor purpleColor];
 UIViewController *fourController = [UIViewController new];
 fourController.view.backgroundColor = [UIColor orangeColor];



 self.tabBar.separatorImage = [UIImage imageNamed:@"separator.jpg"];

 self.controllers = [NSArray arrayWithObjects:oneController,twoController,threeController,fourController, nil];

 [self.tabBar configureTabAtIndex:0 andTitleOrientation :kTitleToRightOfIcon  withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"home"]  andText:@"Home"andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
 [self.tabBar configureTabAtIndex:1 andTitleOrientation : kTitleToRightOfIcon withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"profile"]  andText:@"Profile" andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
 [self.tabBar configureTabAtIndex:2 andTitleOrientation : kTitleToRightOfIcon withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"settings"]  andText:@"Settings" andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
 [self.tabBar configureTabAtIndex:3 andTitleOrientation : kTitleToRightOfIcon withUnselectedBackgroundImage:[UIImage imageNamed:@"unselected.jpeg"] selectedBackgroundImage:[UIImage imageNamed:@"selected.jpeg"] iconImage:[UIImage imageNamed:@"calendar"]  andText:@"Calendar" andTextFont:[UIFont systemFontOfSize:12.0] andFontColour:[UIColor whiteColor]];
   [self selectTabAtIndex:0];

 [GMDCircleLoader setOnView:self.view withTitle:@"Loading..." animated:YES];

    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setUpConstraintsForTabBar{
    
    NMBottomTabBar *tempTabBar = self.tabBar;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[tempTabBar(==50)]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tempTabBar)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tempTabBar]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tempTabBar)]];
    [tempTabBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view setNeedsLayout];

    
}
-(void)setUpConstraintsForContainerView {
    
    NMBottomTabBar *tempTabBar = self.tabBar;

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[containerView]-0-[tempTabBar]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tempTabBar,containerView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[containerView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(containerView)]];
    [containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view setNeedsLayout];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)selectTabAtIndex:(NSInteger)index{
   
   [self.tabBar setTabSelectedWithIndex:index];
}
-(void)didSelectTabAtIndex:(NSInteger)index{

     if(selectedIndex == -1){
        
        UIViewController *destinationController = [self.controllers objectAtIndex:index];
        [self addChildViewController:destinationController];
        [destinationController didMoveToParentViewController:self];
        [containerView addSubview:destinationController.view];
        [self setUpContsraintsForDestinationCOntrollerView:destinationController.view];
        selectedIndex = index;
        
    }
    else if(selectedIndex != index){
        
        UIViewController *sourceController = [self.controllers objectAtIndex:selectedIndex];
        UIViewController *destinationController = [self.controllers objectAtIndex:index];
        [self addChildViewController:destinationController];
        [destinationController didMoveToParentViewController:self];
        [self transitionFromViewController:sourceController toViewController:destinationController duration:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
        
        } completion:^(BOOL finished) {
            
            [sourceController willMoveToParentViewController:nil];
            [sourceController removeFromParentViewController];
           
            [self setUpContsraintsForDestinationCOntrollerView:destinationController.view];
            selectedIndex = index;
            if([self.delegate respondsToSelector:@selector(didSelectTabAtIndex:)]){
                
                [self.delegate didSelectTabAtIndex:selectedIndex];
            
            }
        }];
        
    }

   
}
-(BOOL)shouldSelectTabAtIndex:(NSInteger)index{
    
    if([self.delegate respondsToSelector:@selector(shouldSelectTabAtIndex:)]){
    
    return [self.delegate shouldSelectTabAtIndex:index];
    }
    return YES;
    
}
-(void)setUpContsraintsForDestinationCOntrollerView : (UIView *)view {
    
    [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [containerView setNeedsLayout];

}


@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
