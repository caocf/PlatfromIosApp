//
//  TableViewController.m
//  RTImageLoader
//
//  Created by Ryan Tang on 13-7-7.
//  Copyright (c) 2013年 Ericsson Labs. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
    NSArray *arr_imgs;
}
@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    arr_imgs = @[
                                    @"http://tupian.qqjay.com/u/2013/0227/96_13300_1.jpg",
                                    @"http://tupian.qqjay.com/u/2013/0227/96_13300_1.jpg",
                                    @"http://tupian.qqjay.com/u/2013/0227/96_13300_1.jpg",
                                    @"http://tupian.qqjay.com/u/2013/0227/96_13300_1.jpg",
                                    @"http://tupian.qqjay.com/u/2013/0227/96_13300_1.jpg",
                                    @"http://tupian.qqjay.com/u/2013/0227/96_13300_1.jpg",
                                    @"http://img2.3lian.com/2014/f2/168/d/104.jpg",
                                    @"http://img2.3lian.com/2014/f2/37/d/38.jpg",
                                    @"http://img2.3lian.com/2014/f2/37/d/38.jpg",
                                    @"http://img2.3lian.com/2014/f2/45/d/11.jpg",
                                    @"http://img2.3lian.com/2014/f2/45/d/11.jpg",
                                    @"http://img2.3lian.com/2014/f2/107/d/71.jpg",
                                    @"http://img2.3lian.com/2014/f2/107/d/71.jpg",
                                    @"https://lh4.googleusercontent.com/-cKojDrARNjQ/T3R4qfWSGPI/AAAAAAAAAGY/MR5dnbNaPyY/s1024/sample_image_14.jpg",
                                    @"https://lh3.googleusercontent.com/-WujkdYfcyZ8/T3R4qrIMGUI/AAAAAAAAAGk/277LIdgvnjg/s1024/sample_image_15.jpg",
                                    @"https://lh6.googleusercontent.com/-FMHR7Vy3PgI/T3R4rOXlEKI/AAAAAAAAAGs/VeXrDNDBkaw/s1024/sample_image_16.jpg",
                                    @"https://lh4.googleusercontent.com/-mrR0AJyNTH0/T3R4rZs6CuI/AAAAAAAAAG0/UE1wQqCOqLA/s1024/sample_image_17.jpg",
                                    @"https://lh6.googleusercontent.com/-z77w0eh3cow/T3R4rnLn05I/AAAAAAAAAG4/BaerfWoNucU/s1024/sample_image_18.jpg",
                                    @"https://lh5.googleusercontent.com/-aWVwh1OU5Bk/T3R4sAWw0yI/AAAAAAAAAHE/4_KAvJttFwA/s1024/sample_image_19.jpg",
                                    @"https://lh6.googleusercontent.com/-q-js52DMnWQ/T3R4tZhY2sI/AAAAAAAAAHM/A8kjp2Ivdqg/s1024/sample_image_20.jpg",
                                    @"https://lh5.googleusercontent.com/-_jIzvvzXKn4/T3R4t7xpdVI/AAAAAAAAAHU/7QC6eZ10jgs/s1024/sample_image_21.jpg",
                                    @"https://lh3.googleusercontent.com/-lnGi4IMLpwU/T3R4uCMa7vI/AAAAAAAAAHc/1zgzzz6qTpk/s1024/sample_image_22.jpg",
                                    @"https://lh5.googleusercontent.com/-fFCzKjFPsPc/T3R4u0SZPFI/AAAAAAAAAHk/sbgjzrktOK0/s1024/sample_image_23.jpg",
                                    @"https://lh4.googleusercontent.com/-8TqoW5gBE_Y/T3R4vBS3NPI/AAAAAAAAAHs/EZYvpNsaNXk/s1024/sample_image_24.jpg",
                                    @"https://lh6.googleusercontent.com/-gc4eQ3ySdzs/T3R4vafoA7I/AAAAAAAAAH4/yKii5P6tqDE/s1024/sample_image_25.jpg",
                                    @"https://lh5.googleusercontent.com/--NYOPCylU7Q/T3R4vjAiWkI/AAAAAAAAAH8/IPNx5q3ptRA/s1024/sample_image_26.jpg",
                                    @"https://lh6.googleusercontent.com/-9IJM8so4vCI/T3R4vwJO2yI/AAAAAAAAAIE/ljlr-cwuqZM/s1024/sample_image_27.jpg",
                                    @"https://lh4.googleusercontent.com/-KW6QwOHfhBs/T3R4w0RsQiI/AAAAAAAAAIM/uEFLVgHPFCk/s1024/sample_image_28.jpg",
                                    @"https://lh4.googleusercontent.com/-z2557Ec1ctY/T3R4x3QA2hI/AAAAAAAAAIk/9-GzPL1lTWE/s1024/sample_image_29.jpg",
                                    @"https://lh5.googleusercontent.com/-LaKXAn4Kr1c/T3R4yc5b4lI/AAAAAAAAAIY/fMgcOVQfmD0/s1024/sample_image_30.jpg",
                                    @"https://lh4.googleusercontent.com/-F9LRToJoQdo/T3R4yrLtyQI/AAAAAAAAAIg/ri9uUCWuRmo/s1024/sample_image_31.jpg",
                                    @"https://lh4.googleusercontent.com/-6X-xBwP-QpI/T3R4zGVboII/AAAAAAAAAIs/zYH4PjjngY0/s1024/sample_image_32.jpg",
                                    @"https://lh5.googleusercontent.com/-VdLRjbW4LAs/T3R4zXu3gUI/AAAAAAAAAIw/9aFp9t7mCPg/s1024/sample_image_33.jpg",
                                    @"https://lh6.googleusercontent.com/-gL6R17_fDJU/T3R4zpIXGjI/AAAAAAAAAI8/Q2Vjx-L9X20/s1024/sample_image_34.jpg",
                                    @"https://lh3.googleusercontent.com/-1fGH4YJXEzo/T3R40Y1B7KI/AAAAAAAAAJE/MnTsa77g-nk/s1024/sample_image_35.jpg",
                                    @"https://lh4.googleusercontent.com/-Ql0jHSrea-A/T3R403mUfFI/AAAAAAAAAJM/qzI4SkcH9tY/s1024/sample_image_36.jpg",
                                    @"https://lh5.googleusercontent.com/-BL5FIBR_tzI/T3R41DA0AKI/AAAAAAAAAJk/GZfeeb-SLM0/s1024/sample_image_37.jpg",
                                    @"https://lh4.googleusercontent.com/-wF2Vc9YDutw/T3R41fR2BCI/AAAAAAAAAJc/JdU1sHdMRAk/s1024/sample_image_38.jpg",
                                    @"https://lh6.googleusercontent.com/-ZWHiPehwjTI/T3R41zuaKCI/AAAAAAAAAJg/hR3QJ1v3REg/s1024/sample_image_39.jpg",
                                    // Light images
                                    @"http://tabletpcssource.com/wp-content/uploads/2011/05/android-logo.png",
                                    @"http://simpozia.com/pages/images/stories/windows-icon.png",
                                    @"https://si0.twimg.com/profile_images/1135218951/gmail_profile_icon3_normal.png",
                                    @"http://www.krify.net/wp-content/uploads/2011/09/Macromedia_Flash_dock_icon.png",
                                    @"http://radiotray.sourceforge.net/radio.png",
                                    @"http://www.bandwidthblog.com/wp-content/uploads/2011/11/twitter-logo.png",
                                    @"http://weloveicons.s3.amazonaws.com/icons/100907_itunes1.png",
                                    @"http://thecustomizewindows.com/wp-content/uploads/2011/11/Nicest-Android-Live-Wallpapers.png",
                                    @"http://c.wrzuta.pl/wm16596/a32f1a47002ab3a949afeb4f",
                                    @"http://macprovid.vo.llnwd.net/o43/hub/media/1090/6882/01_headline_Muse.jpg",
                                    @"https://www.eff.org/sites/default/files/chrome150_0.jpg", // Image from HTTPS
                                    @"http://img001.us.expono.com/100001/100001-1bc30-2d736f_m.jpg"];
}

#pragma -UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_imgs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"UITableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }

    NSInteger row = indexPath.row;
    cell.textLabel.text = @"My Text";
    [cell.imageView setImageWithURL:[arr_imgs objectAtIndex:row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ImageViewController *imageViewCtrl = [[ImageViewController alloc] init];
    NSString *imgURL = [arr_imgs objectAtIndex:indexPath.row];
    imageViewCtrl.imgURL = imgURL;
    imageViewCtrl.navigationItem.title = @"ImageView";
    [self.navigationController pushViewController:imageViewCtrl animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
