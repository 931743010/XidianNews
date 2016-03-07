//
//  AppDelegate.m
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "AppDelegate.h"
#import <SVProgressHUD.h>

#import "NewsViewController.h"
#import "ReadingViewController.h"
#import "MediaViewController.h"
#import "TopicViewController.h"
#import "UserViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self setupTabBarController];
    [self customizeAppearance];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)customizeAppearance {
    
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    
    [UITabBar appearance].tintColor = HEXCOLOR(0xdf3031);
    [UITabBar appearance].barTintColor = HEXCOLOR(0xf5f5f5);
    
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = HEXCOLOR(0xdf3031);
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
}

- (void)setupTabBarController {
    NSArray<UIViewController *> *viewControllers = @[[NewsViewController new], [ReadingViewController new], [MediaViewController new], [TopicViewController new],[UserViewController new]];
    NSArray<NSString *> *tabImages = @[@"icon_tabbar_news", @"icon_tabbar_reading", @"icon_tabbar_media", @"icon_tabbar_topic",@"icon_tabbar_user"];
    NSArray<NSString *> *titles = @[@"新闻", @"阅读", @"视听", @"话题", @"我"];
    
    NSArray<UINavigationController *> *navViewControllers = [viewControllers map:^UIViewController *(UIViewController *vc, NSUInteger idx) {
        vc.tabBarItem.image = [[UIImage imageNamed:tabImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:[tabImages[idx] stringByAppendingString:@"_on"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.title = titles[idx];
        return [[UINavigationController alloc] initWithRootViewController:vc];
    }];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.viewControllers = navViewControllers;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
