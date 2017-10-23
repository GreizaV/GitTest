//
//  GTTableViewController.h
//  GitTest
//
//  Created by 戈宇泽 on 2017/10/22.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTBaseViewController.h"

@interface GTTableViewController : GTBaseViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableview;
@end
