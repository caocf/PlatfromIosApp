//
//  FirstSwift.swift
//  PlatfromApp
//
//  Created by zhujohnle on 15/5/6.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

import UIKit


@objc(FirstSwift)
 class FirstSwift : UIViewController{
    override func viewDidLoad(){
        var mButton = UIButton();
        mButton.frame = CGRectMake(10, 10, 10, 10);
        mButton.backgroundColor = UIColor.redColor();
        self.view.addSubview(mButton);
        
        var bottm :  NMBottomTabBar =  NMBottomTabBar();
        
    }
    
}