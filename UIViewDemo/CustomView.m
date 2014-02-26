//
//  CustomView.m
//  UIViewDemo
//
//  Created by David Kraft on 2/19/14.
//  Copyright (c) 2014 David Kraft. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

@synthesize red = _red;
@synthesize green = _green;
@synthesize blue = _blue;
@synthesize userIsTouchingView = _userIsTouchingView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self randomizeBackgroundColor];
        [self setUserIsTouchingView:NO];
    }
    return self;
}

-(void)randomizeBackgroundColor
{
    self.red = (CGFloat)(arc4random() % 256)/255.0;
    self.green = (CGFloat)(arc4random() % 256)/255.0;
    self.blue = (CGFloat)(arc4random() % 256)/255.0;
    
    UIColor *newBackgroundColor = [[UIColor alloc] initWithRed:self.red green:self.green blue:self.blue alpha:1.0];
    
    [self setBackgroundColor:newBackgroundColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if ([self userIsTouchingView])
    {
        //Step 1: Get current context
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //Step 2: Get the view's parameters
        CGPoint currentOrigin = self.bounds.origin;
        CGPoint lowerRightCorner = CGPointMake(self.bounds.origin.x + self.bounds.size.width, self.bounds.origin.y + self.bounds.size.height);
        
        //Step 3: Do the drawing, i.e., make the path
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, currentOrigin.x, currentOrigin.y);
        CGContextAddLineToPoint(context, lowerRightCorner.x, lowerRightCorner.y);
        CGContextAddLineToPoint(context, currentOrigin.x, lowerRightCorner.y);
        CGContextAddLineToPoint(context, lowerRightCorner.x, currentOrigin.y);
        CGContextClosePath(context);
        
        //Step 4: Set the properties of the path
        [[UIColor whiteColor] setStroke];
        CGContextSetLineWidth(context, 4.0);
        
        //Step 5: Commit the path
        CGContextDrawPath(context, kCGPathStroke);
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.superview bringSubviewToFront:self];
    
    UIColor *newBackgroundColor = [[UIColor alloc] initWithRed:self.red green:self.green blue:self.blue alpha:0.5];
    
    [self setBackgroundColor:newBackgroundColor];
    [self setUserIsTouchingView:YES];
    //[self superview] subviews
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIColor *newBackgroundColor = [[UIColor alloc] initWithRed:self.red green:self.green blue:self.blue alpha:1.0];
    
    [self setBackgroundColor:newBackgroundColor];
    [self setUserIsTouchingView:NO];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touchInfo = [touches anyObject];
    
    if (touchInfo.view == self)
    {
        CGPoint touchStart = [touchInfo previousLocationInView:self];
        CGPoint touchEnd = [touchInfo locationInView:self];
        CGFloat xDifference = touchEnd.x - touchStart.x;
        CGFloat yDifference = touchEnd.y - touchStart.y;
        
        CGPoint newCenter = CGPointMake(self.center.x + xDifference, self.center.y + yDifference);
        
        [self setCenter:newCenter];
    }
}

@end
