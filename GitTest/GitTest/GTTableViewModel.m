//
//  GTTableViewModel.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/23.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTTableViewModel.h"

@interface GTTableViewModel()

@end

static AFHTTPSessionManager *manager = nil;
static NSString *host = @"";

@implementation GTTableViewModel

- (Refresh)refresh {
    return ^GTTableViewModel *(id data, UIViewController<UITableViewDataSource, UITableViewDelegate> *list) {
        return self;
    };
}


@end
