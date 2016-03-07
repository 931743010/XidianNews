//
//  NewsContentViewController.m
//  XidianInfo
//
//  Created by Pasco on 16/3/6.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "NewsContentViewController.h"
#import <Masonry.h>

@interface NewsContentViewController ()<UIWebViewDelegate>

@end

@implementation NewsContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = HEXCOLOR(0xf6f6f6);
    NSString *urlString = [NSString stringWithFormat:[APIBaseURL stringByAppendingString:@"XidianInfo/news/news/news.php?newsId=%ld"],self.newsEntityModel.newsIdInAll];
    NSLog(@"%@",urlString);
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
//    webView.dataDetectorTypes = YES;//自动检测网页上的电话号码，单击可以拨打
    webView.delegate = self;
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];
    
    NSURL *url = [NSURL URLWithString:urlString];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    int fontSize = 350;
//    NSString *jsString = [[NSString alloc] initWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%d%%'",fontSize];
//    [webView stringByEvaluatingJavaScriptFromString:jsString];
}


- (void)setNewsEntityModel:(NewsEntityModel *)newsEntityModel {
    _newsEntityModel = newsEntityModel;
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
