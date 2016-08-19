//
//  PDScrollView.m
//  PDScrollLayerStudy
//
//  Created by 彭懂 on 16/8/18.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "PDScrollView.h"

@implementation PDScrollView

+ (Class)layerClass
{
    return [CAScrollLayer class];
}

- (void)setUp {
    self.layer.masksToBounds = YES;
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(recognizerClicked:)];
    [self addGestureRecognizer:recognizer];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (void)recognizerClicked:(UIPanGestureRecognizer *)recognizer
{
    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    [recognizer setTranslation:CGPointZero inView:self];
}

@end
