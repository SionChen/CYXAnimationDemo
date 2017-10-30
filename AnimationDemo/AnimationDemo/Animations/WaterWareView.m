//
//  WaterWareView.m
//  Project_Dms
//
//  Created by 超级腕电商 on 16/11/30.
//  Copyright © 2016年 超级腕电商. All rights reserved.
//

#import "WaterWareView.h"

@interface WaterWareView()
@property (nonatomic, strong) CADisplayLink *waveDisplaylink;
@property (nonatomic, strong) CAShapeLayer *waterWaveLayer;
@property (nonatomic, strong) CAShapeLayer *waterWaveLayer2;
@property (nonatomic, strong) UIColor *waterWaveColor;

@end
@implementation WaterWareView
{
    CGFloat waveA;//水纹振幅
    CGFloat waveW ;//水纹周期
    CGFloat offsetX; //位移
    CGFloat currentK; //当前波浪高度Y
    CGFloat waveSpeed;//水纹速度
    CGFloat waterWaveWidth; //水纹宽度
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds  = YES;
        //设置波浪流动速度
        waveSpeed = 0.08;
        //设置振幅
        waveA = 10;
        //设置周期
        waveW = 0.5/30.0;
        //设置波浪纵向位置
        currentK = 25;//屏幕居中
        offsetX = 0;
        waterWaveWidth = frame.size.width;//设置波浪的宽度
        _waterWaveColor = [UIColor colorWithRed:223/255.0 green:22/255.0 blue:64/255.0 alpha:1];
        [self setUp];
    }
    
    return self;
}


-(void)setUp
{
    [self.layer addSublayer:self.waterWaveLayer];
    //[self.layer addSublayer:self.waterWaveLayer2];
    self.waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    [self.waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
#pragma mark ---Method
-(void)getCurrentWave:(CADisplayLink *)displayLink
{
    //实时的位移
    offsetX += waveSpeed;
    [self setCurrentFirstWaveLayerPath];
}

-(void)setCurrentFirstWaveLayerPath
{
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = currentK;
    //将点移动到 x=0,y=currentK的位置
    CGPathMoveToPoint(path, nil, 0, y);
    for (NSInteger x = 0.0f; x<=waterWaveWidth; x++) {
        //正玄波浪公式
        y = 15 * sin(waveW * x+ 0.5*offsetX)+currentK;
        //将点连成线
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    self.waterWaveLayer.path = path;
    CGPathRelease(path);
    
    //创建一个路径
    path = CGPathCreateMutable();
    y = currentK;
    //将点移动到 x=0,y=currentK的位置
    CGPathMoveToPoint(path, nil, 0, y);
    for (NSInteger x = 0.0f; x<=waterWaveWidth; x++) {
        //正玄波浪公式
        y = 15 * sin(waveW * x+ 0.5*offsetX)+currentK;
        //将点连成线
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    self.waterWaveLayer2.path = path;
    CGPathRelease(path);
}

-(void)dealloc
{
    [_waveDisplaylink invalidate];
}

#pragma mark ---G

-(CAShapeLayer*)waterWaveLayer{
    if(!_waterWaveLayer){
        //初始化
        _waterWaveLayer = [CAShapeLayer layer];
        //设置闭环的颜色
        _waterWaveLayer.fillColor = _waterWaveColor.CGColor;
        //设置边缘线的颜色
        _waterWaveLayer.strokeColor = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
        _waterWaveLayer.lineWidth = 0.0;
        _waterWaveLayer.strokeStart = 0.0;
        _waterWaveLayer.strokeEnd = 0.8;
    }
    return _waterWaveLayer;
}
-(CAShapeLayer*)waterWaveLayer2{
    if(!_waterWaveLayer2){
        //初始化
        _waterWaveLayer2 = [CAShapeLayer layer];
        //设置闭环的颜色
        _waterWaveLayer2.fillColor = _waterWaveColor.CGColor;
        //设置边缘线的颜色
        _waterWaveLayer2.strokeColor = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
        _waterWaveLayer2.lineWidth = 0.0;
        _waterWaveLayer2.strokeStart = 0.0;
        _waterWaveLayer2.strokeEnd = 0.8;
    }
    return _waterWaveLayer2;
}
@end
