//
//  ViewController.m
//  PDScrollLayerStudy
//
//  Created by 彭懂 on 16/8/17.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "ViewController.h"
#import "PDScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PDScrollView *scrollView = [[PDScrollView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    subView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:subView];
}

@end
