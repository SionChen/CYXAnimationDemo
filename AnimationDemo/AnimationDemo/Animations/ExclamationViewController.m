//
//  ExclamationViewController.m
//  AnimationDemo
//
//  Created by 超级腕电商 on 2017/9/28.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "ExclamationViewController.h"
#import "CYXAnimationUtils.h"

@interface ExclamationViewController ()<CAAnimationDelegate>
@property (nonatomic,strong) CAShapeLayer *triangleLayer;
@property (nonatomic,strong) CAShapeLayer *exclamationLayer;
@end

@implementation ExclamationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Exclamation";
    self.view.backgroundColor = [UIColor whiteColor];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self initLayers];
    });
}
-(void)initLayers{
    UIBezierPath * exclamationPath = [[UIBezierPath alloc] init];
    [exclamationPath moveToPoint:CGPointMake(10, 0)];
    [exclamationPath addCurveToPoint:CGPointMake(10, 50) controlPoint1:CGPointMake(5, 0) controlPoint2:CGPointMake(0, 10)];
    [exclamationPath addCurveToPoint:CGPointMake(10, 0) controlPoint1:CGPointMake(20, 10) controlPoint2:CGPointMake(15, 0)];
    
    UIBezierPath * dotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(7, 55, 6, 8)];
    [exclamationPath appendPath:dotPath];
    self.exclamationLayer.path = exclamationPath.CGPath;
    
    UIBezierPath * trianglePath = [[UIBezierPath alloc] init];
    [trianglePath moveToPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-30)];
    [trianglePath addLineToPoint:CGPointMake(self.view.frame.size.width/2-103/tan((60*M_PI)/180), self.view.frame.size.height/2+83-10)];
    [trianglePath addLineToPoint:CGPointMake(self.view.frame.size.width/2+103/tan((60*M_PI)/180), self.view.frame.size.height/2+83-10)];
    [trianglePath addLineToPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-30)];
    self.triangleLayer.path = trianglePath.CGPath;
    CABasicAnimation * triangleAnimation  =[CYXAnimationUtils getAnimationWithKeyPath:@"strokeEnd" duration:0.3 delayTime:0 fromValue:[NSNumber numberWithInt:0] toValue:[NSNumber numberWithInt:1] timingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    triangleAnimation.delegate = self;
    [self.triangleLayer addAnimation:triangleAnimation forKey:@"strokeEnd"];
    [self.view.layer addSublayer:self.triangleLayer];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CABasicAnimation * animation = (CABasicAnimation *)anim;
    if (animation.keyPath!=nil) {
        if ([animation.keyPath isEqualToString:@"strokeEnd"]) {
            CABasicAnimation * animation = [CYXAnimationUtils getAnimationWithKeyPath:@"fillColor" duration:0.3 delayTime:0 fromValue:(id)[UIColor clearColor].CGColor toValue:(id)[UIColor yellowColor].CGColor timingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
            animation.delegate = self;
            [self.triangleLayer addAnimation:animation forKey:@"fillColor"];
            return;
        }
        if ([animation.keyPath isEqualToString:@"fillColor"]) {
            [self.view.layer addSublayer:self.exclamationLayer];
            CABasicAnimation * animation = [CYXAnimationUtils getAnimationWithKeyPath:@"transform.scale" duration:0.4 delayTime:0 fromValue:[NSNumber numberWithInt:0] toValue:[NSNumber numberWithInt:1] timingFunction:[CAMediaTimingFunction functionWithControlPoints:0.25 :0.4 :0.3 :1.6]];
            [self.exclamationLayer addAnimation:animation forKey:nil];
            return;
        }
    }
}
#pragma mark ---G
-(CAShapeLayer*)exclamationLayer{
    if(!_exclamationLayer){
        _exclamationLayer = [[CAShapeLayer alloc] init];
        _exclamationLayer.lineWidth = 1;
        _exclamationLayer.lineCap = kCALineCapRound;
        _exclamationLayer.lineJoin = kCALineJoinRound;
        _exclamationLayer.strokeColor = [UIColor clearColor].CGColor;
        _exclamationLayer.fillColor = [UIColor blackColor].CGColor;
        _exclamationLayer.frame = CGRectMake(self.view.frame.size.width/2-10, self.view.frame.size.height/2, 20, 63);
    }
    return _exclamationLayer;
}
-(CAShapeLayer*)triangleLayer{
    if(!_triangleLayer){
        _triangleLayer = [[CAShapeLayer alloc] init];
        _triangleLayer.lineWidth = 5;
        _triangleLayer.lineCap = kCALineCapRound;//线条拐角
        _triangleLayer.lineJoin = kCALineJoinRound;//终点处理
        _triangleLayer.strokeColor = [UIColor blackColor].CGColor;
        _triangleLayer.fillColor = [UIColor clearColor].CGColor;
    }
    return _triangleLayer;
}
@end
