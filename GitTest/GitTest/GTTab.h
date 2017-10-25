//
//  GTTab.h
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTTabModel;

@interface GTTab : UIView
- (void)setupTabModel:(GTTabModel *)tabModel;
- (void)tapTabWithActionBlock:(void(^)())block;
@end
