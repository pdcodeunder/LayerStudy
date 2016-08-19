//
//  ViewController.m
//  PDXianDuanAnimmation
//
//  Created by 彭懂 on 16/8/17.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "ViewController.h"

#import "PDShapeLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PDShapeLayer *shLayer= [[PDShapeLayer alloc] init];
    shLayer.frame = CGRectMake(100, 100, 200, 200);
    [self.view.layer addSublayer:shLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
