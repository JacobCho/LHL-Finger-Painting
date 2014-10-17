//
//  ViewController.h
//  Finger Painting
//
//  Created by Jacob Cho on 2014-10-17.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"
#import "DrawingView.h"

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet DrawingView *drawingView;
- (IBAction)eraserButtonTouched:(UIButton *)sender;
- (IBAction)blackButtonPressed:(UIButton *)sender;
- (IBAction)redButtonPressed:(UIButton *)sender;

@end

