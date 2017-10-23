//
//  UIView+Color.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/23.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "UIView+Color.h"

@implementation UIView (Color)
- (instancetype)initWithFrame:(CGRect)frame Color:(UIColor *)color {
    if (self = [self initWithFrame:frame]) {
        self.backgroundColor = color;
    }
    return self;
}
@end
