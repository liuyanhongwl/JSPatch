//
//  WebViewController.m
//  JSPatch
//
//  Created by Hong on 16/8/23.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (nonatomic, strong)UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:self.urlString ? self.urlString : @"http://www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
