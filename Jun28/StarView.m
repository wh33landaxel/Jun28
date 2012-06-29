//
//  StarView.m
//  Jun28
//
//  Created by Axel Nunez on 6/28/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import "StarView.h"
#import "StarView2.h"
#import <QuartzCore/QuartzCore.h>
BOOL d = YES;
@implementation StarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    CGRect bounds  = self.bounds;
    
    CGRect f = CGRectMake(bounds.size.width/2-100, bounds.size.height/2 -100 , 200, 200);
    star2 = [[StarView2 alloc] initWithFrame: f];
    [self addSubview: star2];
    CGAffineTransform r = CGAffineTransformMakeRotation(180 * M_PI / 180);
    star2.transform = r;
    return self;
}

- (void) drawRect:(CGRect)rect {

            int aSize = 100.0;
            CGRect bounds = self.bounds;
            float color[4] = { 0.0, 0.0, 1.0, 1.0 }; // Blue
            CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), color);
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetLineWidth(context, aSize);
            CGFloat xCenter = bounds.size.width / 2;
            CGFloat yCenter = bounds.size.height / 2;
            
            float  w = 200.0;
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



- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
        /* 
         [UIView animateWithDuration: 1.0
         delay: 0.0
         options: UIViewAnimationOptionCurveEaseInOut
         animations: ^{
         //This block describes what the animation should do.
         //        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
         //        const CGFloat components[] = {0.0, 1.0, 0.0, 1.0};
         CGPoint p = [[touches anyObject] locationInView: self];
         CGFloat h = self.bounds.size.height;
         
         star.backgroundColor = [UIColor
         colorWithRed: 0.0
         green: p.y / h		//green near the bottom
         blue: (h - p.y) / h	//blue near the top
         alpha: 1.0
         ];
         CGAffineTransform s = CGAffineTransformMakeScale(1, 2);
         CGAffineTransform r = CGAffineTransformMakeRotation(90 * M_PI / 180);
         star.transform = CGAffineTransformConcat(r, s);
         star.center = [[touches anyObject] locationInView: self];
         }
         completion: NULL
         ];
         */
        
        [UIView animateWithDuration: 1.0
                              delay: 0.0
                            options: //UIViewAnimationOptionCurveEaseInOut
         
         UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             //This block describes what the animation should do.
                             [UIView setAnimationRepeatCount: 1];
                             
                             if (d) {
                                 CGAffineTransform r = CGAffineTransformMakeRotation(180 * M_PI / 180);
                                 star2.transform = r;
                                 d = false;
                             }
                             else {
                                 CGAffineTransform r = CGAffineTransformMakeRotation(0 * M_PI / 180);
                                 star2.transform = r;
                                 d = true;
                             }
                             
                             //  star.center = [[touches anyObject] locationInView: self];
                             
                             if (star2.alpha == 1.0) {
                                 //  star.alpha = 0.0;
                             }
                             else {
                                 star2.alpha = 1.0;
                             }
                         }
                         completion: NULL
         
         ];
        
	}

}

@end

