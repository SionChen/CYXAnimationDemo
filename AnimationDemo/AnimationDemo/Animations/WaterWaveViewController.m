//
//  WaterWaveViewController.m
//  AnimationDemo
//
//  Created by 超级腕电商 on 2017/9/28.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "WaterWaveViewController.h"
#import "WaterWareView.h"
@interface WaterWaveViewController ()

@end

@implementation WaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"WaterWave";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViews];
}

-(void)initViews{
    WaterWareView * view = [[WaterWareView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 100)];
    [self.view addSubview:view];
}


@end
