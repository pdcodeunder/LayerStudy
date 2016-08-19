//
//  ViewController.m
//  PDShapeLayerStudy
//
//  Created by 彭懂 on 16/8/11.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "ViewController.h"

#import "PDView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  CAShapeLayer:  使用CGPath去构造任意形状的阴影 是通过矢量图形而不是bitmap来绘制的图层子类
     
        优点：
            1.渲染速度快，CAShapeLayer使用了硬件加速，绘制同一个图形会比用Core Graphics快很多
            2.高效使用内存，不需要创建一个寄宿图形
            3.不会被图层边界剪裁掉，可以在边界外绘制
            4.不会出现像素化，当你给CAShapeLayer做3d变化时，它不像一个有寄宿图的普通图层一样变得像素化
     */
    // 创建一个火柴人
//    [self createFearPeple];
    
//    [self createARCStudy];
    
//    PDView * v = [[PDView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    [self.view addSubview:v];
    
    [self createTeShuText];
}

- (void)createTeShuText
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    [self.view addSubview:label];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowBlurRadius = 1;
    shadow.shadowColor = [UIColor blueColor];
    shadow.shadowOffset = CGSizeMake(2, 4);
    label.textColor = [UIColor redColor];
    NSDictionary *dic = @{
                          NSFontAttributeName: [UIFont boldSystemFontOfSize:50],
                          NSStrokeWidthAttributeName: @(-5),
                          NSStrokeColorAttributeName: [UIColor purpleColor],
                          NSShadowAttributeName: shadow,
                          NSVerticalGlyphFormAttributeName: @(0)
                          };
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"2434" attributes:dic];
    label.attributedText = str;
     // setAnimationRepeatCount
}

/**
 *  创建一个火柴人
 */
- (void)createFearPeple
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    // 创建 shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
}

/**
 *  圆角，可以单独指定一个角
 */
- (void)createARCStudy
{
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
//    baseView.backgroundColor = [UIColor redColor];
    [self.view addSubview:baseView];
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 100, 100)];
    subView.backgroundColor = [UIColor purpleColor];
    [baseView addSubview:subView];
    
    CGRect rect = baseView.bounds;
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopLeft | UIRectCornerTopRight;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor cyanColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    baseView.layer.mask = shapeLayer;
}

@end
