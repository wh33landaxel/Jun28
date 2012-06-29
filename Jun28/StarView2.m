//
//  StarView.m
//  Jun28
//
//  Created by Axel Nunez on 6/28/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import "StarView2.h"
@implementation StarView2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    
    int aSize = 100.0;
    CGRect bounds = self.bounds;
    float color[4] = { 0.0, 5.0, 1.0, 1.0 }; // Blue
    CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), color);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, aSize);
    CGFloat xCenter = bounds.size.width / 2;
    CGFloat yCenter = bounds.size.height / 2;
    
    float  w = 75.0;
    double r = w / 2.0;
    float flip = -1.0;
    
    CGContextSetFillColorWithColor(context, aColor);
    CGContextSetStrokeColorWithColor(context, aColor);
    
    double theta = 2.0 * M_PI * (2.0 / 5.0);
    
    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
    
    for (NSUInteger k=1; k<5; k++) 
    {
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    xCenter += 150.0;
    
    
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}




@end
