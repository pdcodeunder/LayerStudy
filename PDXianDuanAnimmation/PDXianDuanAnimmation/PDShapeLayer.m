//
//  PDShapeLayer.m
//  PDXianDuanAnimmation
//
//  Created by 彭懂 on 16/8/17.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "PDShapeLayer.h"

@interface PDShapeLayer ()

@property (nonatomic, strong) UIBezierPath *rectangleFullPath;

@end

static const CGFloat KLineWidth = 5.0;

@implementation PDShapeLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = [UIColor whiteColor].CGColor;
        self.lineWidth = KLineWidth;
        self.path = self.rectangleFullPath.CGPath;
        self.lineCap = kCALineCapRound;
        self.lineDashPattern = @[@13, @6, @(-2), @165];
        
        CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"lineDashPhase"];
        strokeAnimation.fromValue = @800.0;
        strokeAnimation.toValue = @0.0;
        strokeAnimation.duration = 8;
        strokeAnimation.removedOnCompletion = NO;
        strokeAnimation.repeatCount = INT_MAX;
        [self addAnimation:strokeAnimation forKey:nil];
    }
    return self;
}

- (UIBezierPath *)rectangleFullPath
{
    if (!_rectangleFullPath) {
        UIRectCorner rectCorner = UIRectCornerAllCorners;
        _rectangleFullPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 105, 79) byRoundingCorners:rectCorner cornerRadii:CGSizeMake(10, 10)];
    }
    return _rectangleFullPath;
}



@end
