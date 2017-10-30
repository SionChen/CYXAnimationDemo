//
//  CYXAnimationUtils.m
//  AnimationDemo
//
//  Created by 超级腕电商 on 2017/9/28.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "CYXAnimationUtils.h"

@implementation CYXAnimationUtils


+(CABasicAnimation *)getAnimationWithKeyPath:(NSString *)keyPath
                      duration:(CGFloat)duration
                     delayTime:(CGFloat)delayTime
                     fromValue:(id)fromValue
                       toValue:(id)toValue
                timingFunction:(CAMediaTimingFunction *)timingFunction{
    CABasicAnimation * animation = [[CABasicAnimation alloc] init];
    animation.keyPath = keyPath;
    animation.duration = duration;
    if (delayTime>0) {
        animation.beginTime = CACurrentMediaTime()+delayTime;
    }
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = timingFunction;
    return animation;
}
@end
