//
//  ViewController.m
//  PDTextLayerStudy
//
//  Created by 彭懂 on 16/8/11.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CTFont.h>
#import <CoreText/CTStringAttributes.h>

#import "PDLayerLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  CATextLayer  Core Animation 提供一个CALayer的子类CATextLayer，它以图层的形式包含了UILabel几乎所用的绘制特性，并且额外提供一些新的特性  渲染快
        在iOS 6之前的版本，UIlabel其实是通过WebKit实现，性能很差
     */
//    [self createLabelWithTextLayer];
    
    [self fuwenben];
    
    [self createPDLayerText];
}

/**
 *  创建一个label 用TextLayer的方式
 */
- (void)createLabelWithTextLayer
{
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    labelView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:labelView];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = labelView.bounds;
    [labelView.layer addSublayer:textLayer];
    
    // 设置text 属性文字
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"jdkj LLJK kjfbvjL Longa Ijkfgjld";
    textLayer.string = text;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
}

/**
 *  富文本
 */
- (void)fuwenben
{
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    labelView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:labelView];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = labelView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [labelView.layer addSublayer:textLayer];
    
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    NSString *text = @"FDDXCVCC FCBV  HBVVC   GFFGDNCXJK   NKLDJAFSLJSCK NASJKDF V;SD K;FSADJKF FJS ADFX";
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:text];
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,
                              (__bridge id)kCTFontAttributeName:(__bridge id)fontRef
                              };
    [string setAttributes:attribs range:NSMakeRange(0, [text length])];
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
                (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(3, 9)];
    CFRelease(fontRef);
    
    textLayer.string = string;
}

/**
 *  创建一个自定义文字
 */
- (void)createPDLayerText
{
    PDLayerLabel *label = [[PDLayerLabel alloc] initWithFrame:CGRectMake(50, 400, 200, 200)];
    label.text = @"放大看了觉得不浪费V型处理可能";
    [self.view addSubview:label];
}

@end
