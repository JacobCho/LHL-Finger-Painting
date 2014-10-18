//
//  ViewController.m
//  Finger Painting
//
//  Created by Jacob Cho on 2014-10-17.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    CGPoint pts[4];
    int counter;
    CGPoint startVelocity;
    CGPoint endVelocity;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawingView.arrayOfLines = [[NSMutableArray alloc] init];
    
    
//    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
//    panRecognizer.delegate = self;
//    [self.view addGestureRecognizer:panRecognizer];
}

-(void)panGesture:(UIPanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        startVelocity = [sender velocityInView:self.view];
        
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
        
        
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        endVelocity = [sender velocityInView:self.view];
        CGFloat vx = endVelocity.x - startVelocity.x;
        CGFloat vy = endVelocity.y - startVelocity.y;
        CGFloat velocity = sqrt(vx*vx + vy*vy);
        
        if (velocity > 500) {
            [self.drawingView.path setLineWidth:20.0];
            
        } else if (velocity > 200) {
            [self.drawingView.path setLineWidth:10.0];
        }
        else {
            [self.drawingView.path setLineWidth:2.0];
        }
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.drawingView.path = [[Line alloc] init];
    [self.drawingView.arrayOfLines addObject:self.drawingView.path];
    
    counter = 0;
    
    UITouch *touch = [touches anyObject];
    pts[0] = [touch locationInView:self.drawingView];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.drawingView];
    counter++;
    pts[counter] = p;
    
    if (counter == 3) {
        [self.drawingView.path moveToPoint:pts[0]];
        [self.drawingView.path addCurveToPoint:pts[3] controlPoint1:pts[1] controlPoint2:pts[2]];
        [self.drawingView setNeedsDisplay];
        pts[0] = [self.drawingView.path currentPoint];
        counter = 0;
    }

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
    self.drawingView.path.eraser = YES;
    self.drawingView.path = [[Line alloc] init];
    [self.drawingView.arrayOfLines addObject:self.drawingView.path];

    
    self.drawingView.path.color = [UIColor whiteColor];
    
}

- (IBAction)blackButtonPressed:(UIButton *)sender {
    self.drawingView.path = [[Line alloc] init];
    [self.drawingView.arrayOfLines addObject:self.drawingView.path];
    self.drawingView.path.color = [UIColor blackColor];
    self.drawingView.path.eraser = NO;
}

- (IBAction)redButtonPressed:(UIButton *)sender {
    self.drawingView.path = [[Line alloc] init];
    [self.drawingView.arrayOfLines addObject:self.drawingView.path];
    self.drawingView.path.color = [UIColor redColor];
    

}

- (IBAction)clearBoardPressed:(UIButton *)sender {
    [self.drawingView.arrayOfLines removeAllObjects];
    
    
}
@end
