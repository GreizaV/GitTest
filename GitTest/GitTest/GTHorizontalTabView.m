//
//  GTHorizontalTabView.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTHorizontalTabView.h"
#import "GTBaseTabView.h"

#import "GTTabManager.h"

static CGFloat kTabHeight = 36.0f;

@interface GTHorizontalTabView()<UIScrollViewDelegate, GTBaseTabViewDelegate>
@property (nonatomic, strong) GTBaseTabView *tabView;
@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, strong) NSArray<UIViewController *> *tabControllers;
@end

@implementation GTHorizontalTabView

#pragma mark - life cycle

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    [self createTab];
    [self createContentView];
}

- (void)createTab {
    if (!_tabView) {
        _tabView = [GTBaseTabView new];
        _tabView.delegate = self;
        _tabView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_tabView];
        [_tabView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(kTabHeight);
        }];
    }
}

- (void)createContentView {
    if (!_contentView) {
        _contentView = [UIScrollView new];
        _contentView.backgroundColor = [UIColor greenColor];
        _contentView.contentSize = CGSizeMake(0, 0);
        _contentView.contentOffset = CGPointZero;
        _contentView.bounces = NO;
        _contentView.pagingEnabled = YES;
        _contentView.delegate = self;
        
        [self addSubview:_contentView];
        [_contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_tabView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
    }
}

#pragma mark - public method

- (void)layoutSubviews{
    [super layoutSubviews];
//    LogMethodRaw;
}

- (void)refreshWithTabs:(NSArray<GTTabModel *> *)tabs {
//    LogMethodRaw;
    [self.tabView refreshWithTabs:tabs completion:^{
        
    }];
    self.contentView.contentSize = CGSizeMake(tabs.count *SCREEN_WIDTH, 0);
    self.contentView.contentOffset = CGPointZero;
    
}

- (void)setupTabControllers:(NSArray<UIViewController *> *)tabControllers {
    self.tabControllers = tabControllers;
    CGFloat x = 0;
    for (NSUInteger i=0; i<tabControllers.count; i++) {
        UIView *tabView = [tabControllers objectAtIndex:i].view;
        tabView.frame = CGRectMake(x, kTabHeight, SCREEN_WIDTH, self.height - kTabHeight);
        [self.contentView addSubview:tabView];
        x += SCREEN_WIDTH;
    }
}

#pragma mark - delegate
- (void)tabView:(GTBaseTabView *)tabView didSelectTabAtIndex:(NSUInteger)index {
    [self.contentView setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0) animated:YES];
}


@end
