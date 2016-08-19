
//
//  PDView.m
//  PDShapeLayerStudy
//
//  Created by 彭懂 on 16/8/11.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "PDView.h"

@implementation PDView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect currentBounds = self.bounds;
    
    CGGradientRef backgroundGradient;
    
    size_t num_locations = 2;
    
    CGFloat locations[2] = { 0.0, 1.0 };
    
    CGFloat components[8] = { 0.5, 0.5, 0.5, 0.0, // Start color
        
        0.0, 0.0, 0.0, 0.6
        
    }; // End color
    
    CGColorSpaceRef rgbColorspace = CGColorSpaceCreateDeviceRGB();
    
    backgroundGradient = CGGradientCreateWithColorComponents (rgbColorspace, components, locations, num_locations);
    
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
    
    CGContextDrawRadialGradient (context, backgroundGradient, centerPoint, 0.0, centerPoint, currentBounds.size.width, kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(backgroundGradient);
}

@end
