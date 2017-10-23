//
//  GTTableViewModel.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/23.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTTableViewModel.h"
#import "GTBaseViewController.h"

@interface GTTableViewModel()

@end

static AFHTTPSessionManager *manager = nil;
static NSString *host = @"";

@implementation GTTableViewModel

- (void)dealloc {
    NSLog(@"GTTableViewModel:%@ dealloced!", self);
}

- (Refresh)refresh {
    return ^GTTableViewController *(GTTableViewController *list, void(^Completion)(id data, NSError *error)) {
        
        [manager GET:@""
          parameters:@{}
            progress:^(NSProgress * _Nonnull downloadProgress) {
                
            }
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 
                 if (Completion) {
                     Completion(responseObject, nil);
                 }
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 if (Completion) {
                     Completion(nil, error);
                 }
             }];
        
        return list;
    };
}


@end
