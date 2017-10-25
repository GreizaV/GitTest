//
//  GTTabManager.h
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTTabModel.h"

//@class GTTabModel;

@interface GTTabManager : NSObject
+ (NSArray<GTTabModel *> *)tabs;
+ (void)refresh:(void(^)(NSError *error, NSArray<GTTabModel *> *tabs))completion;
@end
