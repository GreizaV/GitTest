//
//  GTTab.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTTab.h"
#import "GTTabModel.h"

@interface GTTab()
@property (nonatomic, strong) UILabel *tabLabel;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@end

@implementation GTTab

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupTab];
    }
    return self;
}

- (void)setupTab {
    if (!_tabLabel) {
        _tabLabel = [UILabel new];
        _tabLabel.textAlignment = NSTextAlignmentCenter;
        _tabLabel.textColor = [UIColor blackColor];
        _tabLabel.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:_tabLabel];
        [_tabLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
}

- (void)tapTabWithActionBlock:(void (^)())block {
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            block();
        }];
        [self addGestureRecognizer:_tap];
    }
}

- (void)setupTabModel:(GTTabModel *)tabModel {
    self.tabLabel.text = tabModel.tabName;
}
@end
