//
//  DrawingView.m
//  Finger Painting
//
//  Created by Jacob Cho on 2014-10-17.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "DrawingView.h"
#import "Line.h"

@implementation DrawingView


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        self.path.color = [UIColor blackColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    for (Line *line in self.arrayOfLines) {
    [line.color setStroke];
    [line stroke];
    }
    
}


@end
