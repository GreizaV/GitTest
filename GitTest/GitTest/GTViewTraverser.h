//
//  GTViewTraverser.h
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/24.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTViewTraverser : NSObject
+ (void)preorderTraverse:(UIView *)view;
+ (void)inorderTraverse:(UIView *)view;
+ (void)postorderTraverse:(UIView *)view;
@end
