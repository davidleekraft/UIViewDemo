//
//  ViewController.m
//  UIViewDemo
//
//  Created by David Kraft on 2/19/14.
//  Copyright (c) 2014 David Kraft. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createNewView:(id)sender
{
    CGRect newFrame = CGRectMake(20, 20, 140, 100);
    
    CustomView *newView = [[CustomView alloc] initWithFrame:newFrame];
    
    [self.view addSubview:newView];
    
    //NSLog(@"The number of subview is %d", [[[self view] subviews] count]);
    
}
- (IBAction)newColor:(id)sender {
    
    CustomView *lastView = [[self.view subviews] lastObject];
    
    [lastView randomizeBackgroundColor];
    
}

@end
