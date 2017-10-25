//
//  GTBaseTabView.h
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTBaseTabView;
@class GTTabModel;

@protocol GTBaseTabViewDelegate <NSObject>
- (void)tabView:(GTBaseTabView *)tabView didSelectTabAtIndex:(NSUInteger)index;
@end

@interface GTBaseTabView : UIView

@property (nonatomic, weak) id<GTBaseTabViewDelegate> delegate;

- (void)refreshWithTabs:(NSArray<GTTabModel *> *)tabs completion:(dispatch_block_t)completion;
@end
