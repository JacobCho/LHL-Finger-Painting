//
//  DrawingView.h
//  Finger Painting
//
//  Created by Jacob Cho on 2014-10-17.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface DrawingView : UIView
@property (strong, nonatomic) Line *path;
@property (strong, nonatomic) NSMutableArray *arrayOfLines;

@end
