//
//  GTViewTraverser.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/24.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTViewTraverser.h"

@implementation GTViewTraverser

static inline void printview(UIView *view, NSUInteger level) {
    NSMutableString *blank = @"".mutableCopy;
    for (int i = 0; i < level; i++) {
        [blank appendString:@"   "];
    }
    
    NSLog(@"%@:%@", blank, view.class);
}

+ (void)preorderTraverse:(UIView *)view {
    [self preorderTraverse:view level:0];
}

+ (void)inorderTraverse:(UIView *)view {
//    [self inorderTraverse:view level:0];
}

+ (void)postorderTraverse:(UIView *)view {
    [self postorderTraverse:view level:0];
}


+ (void)preorderTraverse:(UIView *)view level:(NSUInteger)level {
    if (nil == view) {
        return;
    }
    printview(view, level);
    
    for (UIView *subview in view.subviews) {
        [self preorderTraverse:subview level:level + 1];
    }
}

//+ (void)inorderTraverse:(UIView *)view level:(NSUInteger)level {
//    if (nil == view) {
//        return;
//    }
//    printview(view, level);
//}

+ (void)postorderTraverse:(UIView *)view level:(NSUInteger)level {
    if (nil == view) {
        return;
    }
    for (UIView *subview in view.subviews) {
        [self postorderTraverse:subview level:level + 1];
    }
    printview(view, level);
}

@end
