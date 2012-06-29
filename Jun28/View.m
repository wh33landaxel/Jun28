//
//  View.m
//  Jun28
//
//  Created by Axel Nunez on 6/28/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import "View.h"
#import "StarView.h"
#import <QuartzCore/QuartzCore.h>
BOOL b = YES;

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        CGRect bounds  = self.bounds;
        
        CGRect f = CGRectMake(bounds.size.width/2-100, bounds.size.height/2 -100 , 200, 200);
        star = [[StarView alloc] initWithFrame: f];
        [self addSubview: star];
    }
    return self;
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
        
         [UIView animateWithDuration: 3.0
         delay: 0.0
         options: //UIViewAnimationOptionCurveEaseInOut
         
         UIViewAnimationOptionCurveEaseInOut
         animations: ^{
         //This block describes what the animation should do.
         [UIView setAnimationRepeatCount: 1];
             
             if (b) {
                 CGAffineTransform r = CGAffineTransformMakeRotation(180 * M_PI / 180);
                 star.transform = r;
                 b = false;
             }
             else {
                 CGAffineTransform r = CGAffineTransformMakeRotation(0 * M_PI / 180);
                 star.transform = r;
                 b = true;
             }
   
       //  star.center = [[touches anyObject] locationInView: self];
         
         if (star.alpha == 1.0) {
       //  star.alpha = 0.0;
         }
         else {
         star.alpha = 1.0;
         }
         }
         completion: NULL
         
         ];
         
	}
}

@end
