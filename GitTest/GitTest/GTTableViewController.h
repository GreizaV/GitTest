//
//  GTTableViewController.h
//  GitTest
//
//  Created by 戈宇泽 on 2017/10/22.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTBaseViewController.h"

@class GTTableViewModel;

@interface GTTableViewController : GTBaseViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) GTTableViewModel *viewModel;

@end
