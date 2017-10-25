//
//  GTUITestViewController.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTUITestViewController.h"
#import "GTTabManager.h"
#import "GTHorizontalTabView.h"

@interface GTUITestViewController ()
@property (nonatomic, strong) GTHorizontalTabView *horizontalTabView;
@end

@implementation GTUITestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0f];
    
    self.horizontalTabView = [GTHorizontalTabView new];
    [self.view addSubview:self.horizontalTabView];
    [self.horizontalTabView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    @weakify(self);
    [GTTabManager refresh:^(NSError *error, NSArray<GTTabModel *> *tabs) {
        @strongify(self);
        [self.horizontalTabView refreshWithTabs:tabs];
        
        UIViewController *vc1 = [UIViewController new];
        vc1.view.backgroundColor = [UIColor blueColor];
        UIViewController *vc2 = [UIViewController new];
        vc2.view.backgroundColor = [UIColor blackColor];
        UIViewController *vc3 = [UIViewController new];
        vc3.view.backgroundColor = [UIColor yellowColor];
        
        [self.horizontalTabView setupTabControllers:@[vc1, vc2, vc3]];
    }];
}

@end
