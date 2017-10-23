//
//  GTTableViewModel.h
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/23.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GTTableViewModel;
@class GTTableViewController;

typedef GTTableViewController *(^Refresh)(GTTableViewController *list, void(^Completion)(id data, NSError *error));

@interface GTTableViewModel : NSObject
- (Refresh)refresh;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
@end
