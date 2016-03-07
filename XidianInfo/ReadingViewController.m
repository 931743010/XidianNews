//
//  ReadingViewController.m
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "ReadingViewController.h"

@interface ReadingViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *horizontalContents;
//@property (nonatomic, strong)

@end

@implementation ReadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)configureViews {
    self.horizontalContents = [[UIScrollView alloc] init];
//    self.horizontalContents.contentSize
    self.horizontalContents.showsVerticalScrollIndicator = NO;
    self.horizontalContents.showsHorizontalScrollIndicator = NO;
    
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
