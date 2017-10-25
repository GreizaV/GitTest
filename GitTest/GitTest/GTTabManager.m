//
//  GTTabManager.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTTabManager.h"


@interface GTTabManager()
@property (nonatomic, strong) NSMutableArray<GTTabModel *> *tabs;
@end

static GTTabManager *tabManager = nil;

@implementation GTTabManager

+ (GTTabManager *)tabManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabManager = [GTTabManager new];
    });
    return tabManager;
}

+ (NSArray<GTTabModel *> *)tabs {
    return [[self tabManager].tabs copy];
}

+ (void)refresh:(void (^)(NSError *, NSArray<GTTabModel *> *))completion {
    GTTabModel *tab1 = [GTTabModel new];
    tab1.tabID = @"1";
    tab1.tabName = @"音乐";
    
    GTTabModel *tab2 = [GTTabModel new];
    tab2.tabID = @"2";
    tab2.tabName = @"视频";
    
    GTTabModel *tab3 = [GTTabModel new];
    tab3.tabID = @"3";
    tab3.tabName = @"电台";
    
    
    if (completion) {
        completion(nil, @[tab1, tab2, tab3].mutableCopy);
    }
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if (completion) {
//            completion(nil, @[tab1, tab2, tab3].mutableCopy);
//        }
//    });
    
}

@end
