//
//  ViewController.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/7/10.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "ViewController.h"
#import "GTViewTraverser.h"
#import "GTUITestViewController.h"
#import "GTPlayController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UILabel *testLayerLabel;
@property (nonatomic, strong) UIImageView *testImageView;
@property (nonatomic, strong) UIImageView *ABImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0f];
    
//    [GTViewTraverser preorderTraverse:self.navigationController.navigationBar];
//    NSLog(@"---");
//    [GTViewTraverser postorderTraverse:self.navigationController.navigationBar];
    
//    NSArray<UIViewController *> *ctrls = @[[UIViewController new],
//                                           [UIViewController new],
//                                           [UIViewController new],
//                                           [UIViewController new]];
//
//    UITabBarController *tabbarCtrl = [[UITabBarController alloc] init];
//    [tabbarCtrl setViewControllers:ctrls animated:NO];
//
//    [GTViewTraverser preorderTraverse:tabbarCtrl.view];
    
//    UIView *view = [UIView new];
//    [self.view addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//    self.backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.backgroundView];
    //    [self.backgroundView setImageURL:[NSURL URLWithString:@"http://s3.pstatp.com/growth/motor/growthactivity/imgs/toparea_83c00340.jpg"]];
    
    CGFloat w = 256.0f;
    CGFloat h = 256.0f / 1.5;
    CGFloat sw = SCREEN_WIDTH;
    self.testImageView = [[UIImageView alloc] initWithFrame:CGRectMake((sw - w)*0.5, 100, w, h)];
    self.testImageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testImageView];
    UIImage *image = [UIImage imageNamed:@"test"];
    NSLog(@"image size:%@", @(image.size));
    
//    CGSize imageSize = image.size;
//    self.testImageView.image = [self clipImageWithImage:image targetSize:CGSizeMake(imageSize.width, imageSize.height) startPoint:CGPointMake(-imageSize.width*0.1, -imageSize.height*0.1)];
    
    
    [self clipTest];
    
    UIImage *image2 = [UIImage imageNamed:@"test"];
    CGFloat bw = w * 1.2;
    CGFloat bh = h * 1.2;
    self.ABImageView = [[UIImageView alloc] initWithFrame:CGRectMake((sw-bw)*0.5, 300, bw, bh)];
    self.ABImageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ABImageView];
    self.ABImageView.image = image2;
}

//CGContextRef convertQuartzCoordinateToUIKitCoordinate(CGFloat contextHeight) {
//    CGContextRef c = UIGraphicsGetCurrentContext();
//    CGContextRotateCTM(c, M_PI);
//    CGContextScaleCTM(c, -1, 1);
//    CGContextTranslateCTM(c, 0, -contextHeight);
//    return c;
//}

- (UIImage *)clipImage:(UIImage *)image startPoint:(CGPoint)startPoint clippedImageSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(c, -startPoint.x, -startPoint.y);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage *clippedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return clippedImage;
}

- (void)clipTest {
    UIImage *image = [UIImage imageNamed:@"test"];
    CGSize size = image.size;
    CGSize clippedSize = CGSizeMake(size.width*0.8, size.height*0.8);
    UIImage *clippedImage = [self clipImage:image startPoint:CGPointMake(0.1*size.width, 0.1*size.height) clippedImageSize:clippedSize];
    
    
//    NSFileManager *manager = [NSFileManager defaultManager];
//    NSString *folder = [[[self class] documentsPath] stringByAppendingPathComponent:@"image"];
//    BOOL isDir = YES;
//    if (![manager fileExistsAtPath:folder isDirectory:&isDir]) {
//        BOOL bCreateor = [manager createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:nil];
//        if (!bCreateor) {
//            NSLog(@"failed to create path!");
//        } else {
//            NSLog(@"create path successfully : %@", folder);
//        }
//    } else {
//        NSLog(@"path exists!");
//    }
//
//    NSString *filePath = [folder stringByAppendingPathComponent:@"clippedImage.png"];
////    [NSKeyedArchiver archiveRootObject:clippedImage toFile:filePath];
//    [UIImagePNGRepresentation(clippedImage) writeToFile:filePath atomically:YES];
    
    
    
    
    self.testImageView.image = clippedImage;
}

//剪裁图片并放大到原来大小
- (UIImage *)clipImageWithImage:(UIImage *)image targetSize:(CGSize)targetSize startPoint:(CGPoint)startPoint {
//    UIGraphicsBeginImageContext(targetSize);
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    CGRect rect = CGRectZero;
    rect.origin = startPoint;
    rect.size   = CGSizeMake(targetSize.width*1.2, targetSize.height*1.2);
    [image drawInRect:rect];
    UIImage *clippedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return clippedImage;
}

- (UIImage *)clipImageWithImage:(UIImage *)image InRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return thumbScale;
}

- (void)layerTest {
    self.testLayerLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 150)/2, 150, 150, 50)];
    self.testLayerLabel.backgroundColor = [UIColor whiteColor];
    self.testLayerLabel.text = @"50条评论";
    self.testLayerLabel.textColor = [UIColor blackColor];
    self.testLayerLabel.font = [UIFont systemFontOfSize:13.0f];
    self.testLayerLabel.textAlignment = NSTextAlignmentCenter;
    self.testLayerLabel.userInteractionEnabled = YES;
    [self.view addSubview:self.testLayerLabel];
    
    
    static BOOL isTapped = NO;
    @weakify(self);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        @strongify(self);
        if (isTapped) {
            self.testLayerLabel.layer.borderWidth = 0;
            self.testLayerLabel.layer.cornerRadius = 0;
            self.testLayerLabel.clipsToBounds = NO;
        } else {
            self.testLayerLabel.layer.borderWidth = 2.0f;
            self.testLayerLabel.layer.cornerRadius = 25.0f;
            self.testLayerLabel.clipsToBounds = YES;
        }
        isTapped = !isTapped;
    }];
    [self.testLayerLabel addGestureRecognizer:tap];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//
////    GTUITestViewController *gtctrl = [GTUITestViewController new];
////    [self.navigationController pushViewController:gtctrl animated:YES];
//
//    GTPlayController *playController = [GTPlayController new];
//    [self.navigationController pushViewController:playController animated:YES];
//}

+ (NSString *)documentsPath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

@end
