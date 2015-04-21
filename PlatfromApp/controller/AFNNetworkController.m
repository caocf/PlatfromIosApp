//
//  AFNNetworkController.m
//  ordero2o-platform
//
//  Created by mac on 15-4-17.
//  Copyright (c) 2015年 cirsqu. All rights reserved.
//

#import "AFNNetworkController.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworkReachabilityManager.h"
#import "AFURLSessionManager.h"


@interface AFNNetworkController  () <NSURLSessionTaskDelegate>

@property (nonatomic, strong) NSURLSession *session;
@end

@implementation AFNNetworkController

- (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view.


}

- (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
}

- (void) didGetDataByHttp{

}

// 用于对网络状态的监控

-(void) didReachNetworkstate{
 // 1.获得网络监控的管理者
 AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];

 // 2.设置网络状态改变后的处理
 [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
  // 当网络状态改变了, 就会调用这个block
  switch (status) {
   case AFNetworkReachabilityStatusUnknown: // 未知网络
    NSLog(@"未知网络");
    break;

   case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
    NSLog(@"没有网络(断网)");
    break;

   case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
    NSLog(@"手机自带网络");
    break;

   case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
    NSLog(@"WIFI");
    break;
  }
 }];

 // 3.开始监控
 [mgr startMonitoring];
}

-(void) aFnNetworkGetData{

 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 [manager GET:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
  NSLog(@"JSON: %@", responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
  NSLog(@"Error: %@", error);
 }];

}

//for url-from-encode
-(void) aFnNetworkPostData{
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 NSDictionary *parameters = @{@"foo": @"bar"};
 [manager POST:@"http://example.com/resources.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
  NSLog(@"JSON: %@", responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
  NSLog(@"Error: %@", error);
 }];
}

//POST Multi-Part Request
-(void)afnNetWorkMui{
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 NSDictionary *parameters = @{@"foo": @"bar"};
 NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
 [manager POST:@"http://example.com/resources.json" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
  [formData appendPartWithFileURL:filePath name:@"image" error:nil];
 } success:^(AFHTTPRequestOperation *operation, id responseObject) {
  NSLog(@"Success: %@", responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
  NSLog(@"Error: %@", error);
 }];
}

//下载文件
-(void)downLoadTask{
 NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
 AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

 NSURL *URL = [NSURL URLWithString:@"http://example.com/download.zip"];
 NSURLRequest *request = [NSURLRequest requestWithURL:URL];

 NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
  NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
  return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
 } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
  NSLog(@"File downloaded to: %@", filePath);
 }];
 [downloadTask resume];
}


-(void) uploadImageData{
 NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
 AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

 NSURL *URL = [NSURL URLWithString:@"http://example.com/upload"];
 NSURLRequest *request = [NSURLRequest requestWithURL:URL];

 NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
 NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
  if (error) {
   NSLog(@"Error: %@", error);
  } else {
   NSLog(@"Success: %@ %@", response, responseObject);
  }
 }];
 [uploadTask resume];
}


/**
 *  使用session上传 有进度条数据
 */
- (void)uploadFile2
{
 NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost/post/upload.php"]cachePolicy:1 timeoutInterval:7];

 request.HTTPMethod = @"post";

 // boundary可随意命名
 NSString *boundary = @"chen";

 // 拼接请求头
 [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary] forHTTPHeaderField:@"Content-Type"];

 // 创建可变data 后面一样拼接
 NSMutableData *myData = [NSMutableData data];

 NSString *str = [NSString stringWithFormat:@"--%@\n",boundary];
 [myData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];

 // html页面上传表单里的 <input type="file" name="userfile">
 NSString *name = @"userfile";
 // 上传后文件的名字
 NSString *filename = @"1.zip";

 str = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\n",name,filename];
 [myData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];

 str = @"Content-Type: application/octet-stream\n\n";
 [myData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];

 // bundle中的文件转换成二进制数据
 NSURL *uploadFile = [[NSBundle mainBundle]URLForResource:@"music.mp3.zip" withExtension:nil];
 [myData appendData:[NSData dataWithContentsOfURL:uploadFile]];

 str = [NSString stringWithFormat:@"\n\n--%@--",boundary];
 [myData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];

 request.HTTPBody = myData;
 [[self.session uploadTaskWithRequest:request fromData:myData]resume];
}

#pragma mark - 检测上传进度
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
   didSendBodyData:(int64_t)bytesSent
    totalBytesSent:(int64_t)totalBytesSent
totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
 float progress = (float)totalBytesSent / totalBytesExpectedToSend;
 NSLog(@"%f %@", progress, [NSThread currentThread]);
}
#pragma mark - 上传完成的回调
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
 NSLog(@"完成");
}

// 懒加载 (定义了 nonatomic,非线程安全 当使用的时候默认会读取此方法)
- (NSURLSession *)session
{
 if(_session == nil)
 {
  NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
  _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
 }
 return _session;
}




-(void) sendDataWithPause{

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
