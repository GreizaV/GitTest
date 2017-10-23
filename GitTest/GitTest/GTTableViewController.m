//
//  GTTableViewController.m
//  GitTest
//
//  Created by 戈宇泽 on 2017/10/22.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTTableViewController.h"

@interface GTTableViewController ()

@end

@implementation GTTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableview.tableFooterView = [UIView new];
    self.tableview.backgroundView = [[UIView alloc] initWithFrame:self.tableview.bounds Color:[UIColor lightGrayColor]];
    
    if (@available(iOS 11.0, *)) {
        self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
        _tableview.translatesAutoresizingMaskIntoConstraints = NO;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.separatorColor = [UIColor grayColor];
        _tableview.sectionIndexColor = [UIColor blackColor];
        _tableview.backgroundColor = [UIColor clearColor];
        _tableview.dataSource = self;
        _tableview.delegate   = self;
        [self.view addSubview:_tableview];
        [_tableview mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(64.0f);
            make.left.right.bottom.equalTo(self.view);
        }];
    }
    return _tableview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
