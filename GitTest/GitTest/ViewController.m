//
//  ViewController.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/7/10.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "ViewController.h"
#import "GTViewTraverser.h"
#import "GTUITestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.view.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0f];
    
//    [GTViewTraverser preorderTraverse:self.navigationController.navigationBar];
//    NSLog(@"---");
//    [GTViewTraverser postorderTraverse:self.navigationController.navigationBar];
    
//    NSArray<UIViewController *> *ctrls = @[[UIViewController new],
//                                           [UIViewController new],
//                                           [UIViewController new],
//                                           [UIViewController new]];
//
//    UITabBarController *tabbarCtrl = [[UITabBarController alloc] init];
//    [tabbarCtrl setViewControllers:ctrls animated:NO];
//
//    [GTViewTraverser preorderTraverse:tabbarCtrl.view];
    
//    UIView *view = [UIView new];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    GTUITestViewController *gtctrl = [GTUITestViewController new];
    [self.navigationController pushViewController:gtctrl animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
