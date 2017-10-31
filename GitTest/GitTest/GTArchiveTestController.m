//
//  GTArchiveTestController.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/26.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTArchiveTestController.h"

@interface GTArchiveTestController ()
@property (nonatomic, strong) UIImageView *backgroundView;
@end

@implementation GTArchiveTestController

static inline NSString *documentsPath() {
    return [GTArchiveTestController documentsPath];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.backgroundView];
    //NSLog(@"path:%@", [[self class] documentsPath]);
}

+ (NSString *)documentsPath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *folder = [documentsPath() stringByAppendingPathComponent:@"image"];
    BOOL isDir = YES;
    if (![manager fileExistsAtPath:folder isDirectory:&isDir]) {
        BOOL bCreateor = [manager createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:nil];
        if (!bCreateor) {
            NSLog(@"failed to create path!");
        } else {
            NSLog(@"create path successfully : %@", folder);
        }
    } else {
        NSLog(@"path exists!");
    }
    
    NSString *filePath = [folder stringByAppendingPathComponent:@"back.jpg"];
    UIImage *archivedImage = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if (archivedImage) {
        self.backgroundView.image = archivedImage;
        NSLog(@"use loacl image!");
    } else {
        __block UIImage *image = nil;
        
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://s3.pstatp.com/growth/motor/growthactivity/imgs/toparea_83c00340.jpg"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundView.image = image;
            });
            
            BOOL isArchived = [NSKeyedArchiver archiveRootObject:image toFile:filePath];
            if (isArchived) {
                NSLog(@"archived successfully!");
            } else {
                NSLog(@"failed to archive files");
            }
        }];
        
        [task resume];
        
        NSLog(@"use remote image!");
    }
}

@end
