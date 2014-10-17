//
//  ViewController.m
//  Finger Painting
//
//  Created by Jacob Cho on 2014-10-17.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawingView.arrayOfLines = [[NSMutableArray alloc] init];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.drawingView.path = [[Line alloc] init];
    [self.drawingView.arrayOfLines addObject:self.drawingView.path];
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.drawingView];
    [self.drawingView.path moveToPoint:p];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.drawingView];
    [self.drawingView.path addLineToPoint:p];
    [self.drawingView setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

- (IBAction)eraserButtonTouched:(UIButton *)sender {
    self.drawingView.path = [[Line alloc] init];
    [self.drawingView.arrayOfLines addObject:self.drawingView.path];
    self.drawingView.path.color = [UIColor whiteColor];
    [self.drawingView.path setLineWidth:20];
}

- (IBAction)blackButtonPressed:(UIButton *)sender {
    self.drawingView.path = [[Line alloc] init];
    [self.drawingView.arrayOfLines addObject:self.drawingView.path];
    self.drawingView.path.color = [UIColor blackColor];
}

- (IBAction)redButtonPressed:(UIButton *)sender {
    self.drawingView.path = [[Line alloc] init];
    [self.drawingView.arrayOfLines addObject:self.drawingView.path];
    self.drawingView.path.color = [UIColor redColor];
}
@end
