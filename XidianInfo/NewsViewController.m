//
//  NewsViewController.m
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsApi.h"
#import "NewsEntityCell.h"
#import "NewsEntityModel.h"
#import "NewsContentViewController.h"
#import <Masonry.h>

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *arraylist;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *bannerScrollView;
@property (nonatomic, strong) NSMutableArray *newsListArray;
@property (nonatomic, copy)  NSString *cellIdentifier;
@property (nonatomic, strong) UITableViewCell *prototypeCell;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.arraylist = @[@"西点新闻", @"本科教学", @"研究生教学", @"科研信息", @"合作交流", @"学生工作", @"人事动态", @"本科招生", @"学生就业"];
    [self addLabels];
    self.newsListArray = [[NSMutableArray alloc] init];
    self.cellIdentifier = @"NewsEntityCell";
    [self addController];
    [self configureViewControllerAt:0];
//    __weak typeof(self)weakself = self;
//    [[NewsApi alloc] getXDXWNewsList:^(id data, NSError *error) {
//        if (data) {
//            NSArray *dataArray = data;
//            [weakself.newsListArray removeAllObjects];
//            weakself.newsListArray = [[NSMutableArray alloc] initWithArray:dataArray];
//            UITableViewController *vc1 = [self.childViewControllers firstObject];
//            vc1.tableView = [[UITableView alloc] init];
//            vc1.tableView.delegate = self;
//            [vc1.tableView reloadData];
//        }
//    } atPage:0];
    
    
}


- (void)loadView {
    [super loadView];
//    [self addController];
    [self configureViews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self configureSubviewsFrame];
}



/** 添加子控制器 */
- (void)addController
{
    for (int i=0 ; i<9 ;i++){
        UITableViewController *vc = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        [self addChildViewController:vc];
    }

}


- (void)configureViewControllerAt:(NSInteger)index {
    UITableViewController *vc = self.childViewControllers[index];
    if ([vc.tableView isDescendantOfView:self.scrollView]) {
        NSLog(@"1111111");
    } else {
        NSLog(@"0000000");
        vc.tableView = [[UITableView alloc] init];
        vc.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        vc.tableView.delegate = self;
        vc.tableView.dataSource = self;
        vc.tableView.backgroundColor = [UIColor orangeColor];
        [self.scrollView addSubview:vc.tableView];
        
        //    UIView *firstView = [self.childViewControllers firstObject].view;
        [vc.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.scrollView.mas_top).with.offset(0);
            make.left.equalTo(self.scrollView.mas_left).with.offset(kScreenWidth*index);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
            make.width.equalTo(@(kScreenWidth));
            
        }];
    }
}


/** 添加标题栏 */
- (void)addLabels
{
    for (int i = 0; i < 9; i++) {
        CGFloat lblW = 85;
        CGFloat lblH = 32;
        CGFloat lblY = 0;
        CGFloat lblX = i * lblW;
        UILabel *lbl1 = [[UILabel alloc]init];
//        UIViewController *vc = self.childViewControllers[i];
        lbl1.text =self.arraylist[i];
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        lbl1.font = [UIFont systemFontOfSize:16];
        [self.bannerScrollView addSubview:lbl1];
        lbl1.tag = i;
        lbl1.userInteractionEnabled = YES;
        
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    self.bannerScrollView.contentSize = CGSizeMake(85 * 9, 0);
    
}


- (void)lblClick:(id)sender {
    
}




- (void)configureViews {
    self.bannerScrollView = [[UIScrollView alloc] init];
    self.bannerScrollView.delegate = self;
    self.bannerScrollView.contentSize = CGSizeMake(kScreenWidth*2, 36);
//    self.bannerScrollView.pagingEnabled = YES;
    self.bannerScrollView.showsHorizontalScrollIndicator = NO;
    self.bannerScrollView.showsVerticalScrollIndicator = NO;
    self.bannerScrollView.backgroundColor = HEXCOLOR(0xff00ff);
    [self.view addSubview:self.bannerScrollView];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*9, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.backgroundColor = HEXCOLOR(0x00ffff);
    [self.view addSubview:self.scrollView];
    
//    self.tableView                 = [[UITableView alloc] init];
//    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleSingleLine;
//    self.tableView.delegate        = self;
//    self.tableView.dataSource      = self;
//    [self.scrollView addSubview:self.tableView];

    
//    self.prototypeCell = (NewsEntityCell *)[vc1.tableView dequeueReusableCellWithIdentifier:@"NewsEntityCell"];
//    if (!self.prototypeCell) {
//        self.prototypeCell = [[NewsEntityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewsEntityCell"];
//    }
}


- (void)configureSubviewsFrame {
    [self.bannerScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.height.equalTo(@(36.0));
    }];
    

    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bannerScrollView.mas_bottom).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsEntityCell *cell = (NewsEntityCell *)[tableView dequeueReusableCellWithIdentifier:@"NewsEntityCell"];
    if (!cell) {
        cell = [[NewsEntityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewsEntityCell"];
    }
    NewsEntityModel *newsEntityModel = [self.newsListArray objectAtIndex:indexPath.row];
    cell.newsTitleLabel.text = newsEntityModel.newsTitle;
    cell.newsFromLabel.text = newsEntityModel.newsFrom;
    cell.newsTimeLabel.text = newsEntityModel.newsTime;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsEntityCell *cell = (NewsEntityCell *)self.prototypeCell;
    NewsEntityModel *newsEntityModel = [self.newsListArray objectAtIndex:indexPath.row];
    cell.newsTitleLabel.text = newsEntityModel.newsTitle;
    CGSize titleSize = [newsEntityModel.newsTitle calculateSize:CGSizeMake(kScreenWidth-10, FLT_MAX) font:cell.newsTitleLabel.font];
    CGSize timeSize = [newsEntityModel.newsTime calculateSize:CGSizeMake(0, FLT_MAX) font:cell.newsTimeLabel.font];
    return titleSize.height + timeSize.height + 33;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsContentViewController *newsContentViewController = [[NewsContentViewController alloc] init];
    newsContentViewController.newsEntityModel = [self.newsListArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:newsContentViewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark -- UIScrollView

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f====",scrollView.contentOffset.x);
////    NSUInteger scrollPageIndex = scrollView.contentOffset.x/kScreenWidth;
////    NSLog(@"%ld",scrollPageIndex);
//    if (self.scrollView.contentOffset.x>0 && self.scrollView.contentOffset.x<kScreenWidth*8) {
//        CGPoint bannerScrollViewOffset = CGPointMake(((self.scrollView.contentOffset.x)/(kScreenWidth*8))*(85 * 9-kScreenWidth), 0);
//        [self.bannerScrollView setContentOffset:bannerScrollViewOffset animated:NO];
//    }
//}


//只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    //    NSLog(@" scrollViewDidScroll");
    NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}
//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewWillBeginDragging");
}
//完成拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    NSLog(@"scrollViewDidEndDragging");
}
//将开始降速时
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

//减速停止了时执行，手触摸时执行执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewDidEndDecelerating");
    NSInteger Index = self.scrollView.contentOffset.x/kScreenWidth;
    [self configureViewControllerAt:Index];
}
//滚动动画停止时执行,代码改变时出发,也就是setContentOffset改变时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewDidEndScrollingAnimation");
    
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
