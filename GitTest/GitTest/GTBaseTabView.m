//
//  GTBaseTabView.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTBaseTabView.h"
#import "GTTab.h"
#import "GTTabModel.h"

static CGFloat kBottomLineHeight = 2.0f;

@interface GTBaseTabView()<UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray<GTTab *> *tabs;
@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) NSMutableArray<GTTabModel *> *tabModels;
@property (nonatomic, assign) CGFloat tabWidth;
@end

@implementation GTBaseTabView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupTabView];
    }
    return self;
}

#pragma mark - public method

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutTabView];
//    LogMethodRaw;
}

- (void)refreshWithTabs:(NSArray<GTTabModel *> *)tabs completion:(dispatch_block_t)completion {
//    LogMethodRaw;
    self.tabModels = [tabs mutableCopy];
    [self layoutTabView];
    if (completion) {
        completion();
    }
}

- (void)layoutTabView {
    for (GTTab *subview in self.tabs) {
        [subview removeFromSuperview];
    }
    
    NSArray<GTTabModel *> *tabs = self.tabModels.copy;
    NSUInteger count = tabs.count;
    if (count <= 0) {
        return;
    }
    CGFloat tabWidth = SCREEN_WIDTH * 1.0 / count;
    self.tabWidth = tabWidth;
    CGFloat x = 0;
    
    for (NSUInteger i = 0; i < count; i++) {
        GTTab *tab = [[GTTab alloc] initWithFrame:CGRectMake(x, 0, tabWidth, self.height)];
        @weakify(self);
        [tab tapTabWithActionBlock:^{
            @strongify(self);
            [self selectTabAtIndex:i animated:YES];
        }];
        [tab setupTabModel:[tabs objectAtIndex:i]];
        [self.contentView addSubview:tab];
        x += tabWidth;
    }
    
    [self selectTabAtIndex:0 animated:NO];
    self.bottomLine.frame = CGRectMake(0, self.height - kBottomLineHeight, tabWidth, kBottomLineHeight);
}


#pragma mark - private method

- (void)setupTabView {
    _tabs = [NSMutableArray new];
    [self createContentView];
    [self createBottomLine];
}

- (void)createContentView {
    if (!_contentView) {
        _contentView = [UIScrollView new];
        _contentView.backgroundColor = [UIColor clearColor];
        _contentView.contentSize = CGSizeMake(0, 0);
        _contentView.contentOffset = CGPointZero;
        _contentView.bounces = NO;
        _contentView.delegate = self;
        [self addSubview:_contentView];
        [_contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.bottom.equalTo(self).offset(-kBottomLineHeight);
        }];
    }
}

- (void)createBottomLine {
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = [UIColor redColor];
        [self addSubview:_bottomLine];
    }
}

- (void)selectTabAtIndex:(NSUInteger)index animated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.4f animations:^{
            self.bottomLine.frame = CGRectMake(index * self.tabWidth, self.height-kBottomLineHeight, self.tabWidth, kBottomLineHeight);
        } completion:^(BOOL finished) {
            
        }];
    } else {
        self.bottomLine.frame = CGRectMake(index * self.tabWidth, self.height-kBottomLineHeight, self.tabWidth, kBottomLineHeight);
    }
    
    if ([self.delegate respondsToSelector:@selector(tabView:didSelectTabAtIndex:)]) {
        [self.delegate tabView:self didSelectTabAtIndex:index];
    }
}

@end
