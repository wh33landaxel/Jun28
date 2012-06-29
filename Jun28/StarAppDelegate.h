//
//  StarAppDelegate.h
//  Jun28
//
//  Created by Axel Nunez on 6/28/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface StarAppDelegate : UIResponder <UIApplicationDelegate>{
    View *view;
    UIWindow *window; 
}

@property (strong, nonatomic) UIWindow *window;
                     
@end
