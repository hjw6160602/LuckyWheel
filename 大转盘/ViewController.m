//
//  ViewController.m
//  大转盘
//
//  Created by shoule on 15/7/9.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "ViewController.h"
#import "BigWheelController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic)UIView *cover;
@end


@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self randomBG];
    [self performSelector:@selector(showCountDown) withObject:nil afterDelay:1];
}

- (void)showCountDown{
    self.cover = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.cover.backgroundColor = [UIColor blackColor];
    self.cover.alpha = 0.6f;
    //UIWindow *window = self.view.window;

    UIWindow *window= [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self.cover];
    NSMutableArray *gifArray = [NSMutableArray array];
    NSInteger i = 0;
    while (i<3) {
        NSString *name = [NSString stringWithFormat:@"倒计时%ld", (long)++i];
        [gifArray addObject:[UIImage imageNamed:name]];
    }
    UIImageView *gifImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    gifImageView.animationImages =gifArray; //动画图片数组
    gifImageView.animationDuration = 3; //执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = 1;
    [[UIApplication sharedApplication].keyWindow addSubview:gifImageView];
    [gifImageView startAnimating];
    [self performSelector:@selector(stopCountDown:) withObject:gifImageView afterDelay:3];
    
}

- (void)stopCountDown:(UIImageView *)imageView{
    BigWheelController *bigWheelController = [BigWheelController new];
    [self presentViewController:bigWheelController animated:NO completion:nil];
    [self.cover removeFromSuperview];
    [imageView removeFromSuperview];
}

- (void)randomBG{
    NSInteger x = arc4random() % 5;
    switch (x) {
        case 0:
            self.imageView.image = [UIImage imageNamed:@"IMG_2377"];
            break;
        case 1:
            self.imageView.image = [UIImage imageNamed:@"IMG_2378"];
            break;
        case 2:
            self.imageView.image = [UIImage imageNamed:@"IMG_2379"];
            break;
        case 3:
            self.imageView.image = [UIImage imageNamed:@"IMG_2380"];
            break;
        case 4:
            self.imageView.image = [UIImage imageNamed:@"IMG_2381"];
            break;
        default:
            break;
    }
    
}

@end
