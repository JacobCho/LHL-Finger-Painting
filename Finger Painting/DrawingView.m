//
//  DrawingView.m
//  Finger Painting
//
//  Created by Jacob Cho on 2014-10-17.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "DrawingView.h"
#import "Line.h"

@implementation DrawingView {
    
    NSMutableArray *arrayOfLines;
    Line *path;
    UIColor *color;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        arrayOfLines = [[NSMutableArray alloc] init];
        color = [UIColor blackColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    [color setStroke];
    [path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    path = [[Line alloc] init];
    [path setLineWidth:2.0];
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
    [arrayOfLines addObject:path];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}


- (IBAction)eraserButtonPressed:(UIButton *)sender {
    color = [UIColor whiteColor];
}

- (IBAction)blackButtonPressed:(UIButton *)sender {
    
    color = [UIColor blackColor];
}

- (IBAction)redButtonPressed:(UIButton *)sender {
    
    color = [UIColor redColor];
}
@end
