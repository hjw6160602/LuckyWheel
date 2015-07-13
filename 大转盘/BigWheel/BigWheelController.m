//
//  BigWheelController.m
//  BestCake3.0
//
//  Created by shoule on 15/7/10.
//  Copyright (c) 2015年 shoule. All rights reserved.
//

#import "BigWheelController.h"

@interface BigWheelController ()

@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *dismissBtn;

@property (strong,nonatomic) NSMutableArray *gifArray;

@end

@implementation BigWheelController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControls];
}

- (void)initControls{
    self.stopBtn.hidden = YES;
    self.dismissBtn.hidden = YES;
}

- (IBAction)Play {
    self.playBtn.hidden = YES;
    [self GifAnimate];
    self.stopBtn.hidden = NO;
    [self.stopBtn addTarget:self action:@selector(Stop) forControlEvents:UIControlEventTouchUpInside];
}

- (void)GifAnimate{
    self.gifArray = [NSMutableArray array];
    NSInteger i = 0;
    while (i<5) {
        NSString *name = [NSString stringWithFormat:@"转盘转动%ld", (long)++i];
        [self.gifArray addObject:[UIImage imageNamed:name]];
    }
    self.gifImageView.animationImages = self.gifArray; //动画图片数组
    self.gifImageView.animationDuration = 0.8; //执行一次完整动画所需的时长
    self.gifImageView.animationRepeatCount = 0;
    [self.gifImageView startAnimating];
}

- (void)Stop{
    [self.gifImageView stopAnimating];
    self.stopBtn.hidden = YES;
    [self randomBigWheel];

    self.dismissBtn.hidden = NO;
    [self.dismissBtn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
}

- (void)randomBigWheel{
    NSInteger x = arc4random() % 6;
    switch (x) {
        case 0:
            self.gifImageView.image = [UIImage imageNamed:@"已抽到10元优惠券"];
            break;
        case 1:
            self.gifImageView.image = [UIImage imageNamed:@"已抽到15元优惠券"];
            break;
        case 2:
            self.gifImageView.image = [UIImage imageNamed:@"已抽到20元优惠券"];
            break;
        case 3:
            self.gifImageView.image = [UIImage imageNamed:@"已抽到25元优惠券"];
            break;
        case 4:
            self.gifImageView.image = [UIImage imageNamed:@"已抽到30元优惠券"];
            break;
        case 5:
            self.gifImageView.image = [UIImage imageNamed:@"已抽到50元优惠券"];
            break;
        default:
            break;
    }
    
}

- (void)dismissVC {
    self.playBtn.hidden = NO;
    self.dismissBtn.hidden = YES;
    self.gifImageView.image = [UIImage imageNamed:@"开始点击页"];
}


@end
