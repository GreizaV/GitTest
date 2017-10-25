//
//  GTHorizontalTabView.h
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTTabModel;

@interface GTHorizontalTabView : UIView
- (void)refreshWithTabs:(NSArray<GTTabModel *> *)tabs;
- (void)setupTabControllers:(NSArray<UIViewController *> *)tabControllers;
@end
