//
//  ViewController.m
//  PDReplicatorLayerStudy
//
//  Created by 彭懂 on 16/8/15.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "ViewController.h"
#import "ReflectionView.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *containtView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  CAReplicatorLayer的目的是为了高效生成许多相似的图层。它会绘制一个或多个图层的子图层，并在每个复制体上应用不同的变换。
     */
    self.view.backgroundColor = [UIColor grayColor];
    UIView *containtView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:containtView];
    containtView.backgroundColor = [UIColor greenColor];
    self.containtView = containtView;
    [self createARCReplicator];
    
    ReflectionView *reflec = [[ReflectionView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    reflec.layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view addSubview:reflec];
}

- (void)createARCReplicator
{
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.backgroundColor = [UIColor purpleColor].CGColor;
    replicator.frame = self.containtView.bounds;
    [self.containtView.layer addSublayer:replicator];
    
    // 设置重复次数
    replicator.instanceCount = 10;
    
    // 设置梯度变化
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    replicator.instanceTransform = transform;
    
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    replicator.instanceDelay = 0.5;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 50, 100, 100);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
}

@end
