//
//  CYXAnimationUtils.h
//  AnimationDemo
//
//  Created by 超级腕电商 on 2017/9/28.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CYXAnimationUtils : NSObject
+(CABasicAnimation *)getAnimationWithKeyPath:(NSString *)keyPath
                      duration:(CGFloat)duration
                     delayTime:(CGFloat)delayTime
                     fromValue:(id)fromValue
                       toValue:(id)toValue
                timingFunction:(CAMediaTimingFunction *)timingFunction;

@end
