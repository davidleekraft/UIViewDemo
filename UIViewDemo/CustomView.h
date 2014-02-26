//
//  CustomView.h
//  UIViewDemo
//
//  Created by David Kraft on 2/19/14.
//  Copyright (c) 2014 David Kraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property (nonatomic) CGFloat red;
@property (nonatomic) CGFloat green;
@property (nonatomic) CGFloat blue;
@property (nonatomic) BOOL userIsTouchingView;

-(void)randomizeBackgroundColor;

@end
