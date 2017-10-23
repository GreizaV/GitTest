//
//  GTTableViewModel.h
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/23.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GTTableViewModel;

typedef GTTableViewModel *(^Refresh)(id data, UIViewController<UITableViewDataSource, UITableViewDelegate> *list);

@interface GTTableViewModel : NSObject
- (Refresh)refresh;
@end
