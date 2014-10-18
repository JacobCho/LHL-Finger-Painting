//
//  Line.m
//  Finger Painting
//
//  Created by Jacob Cho on 2014-10-17.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "Line.h"

@implementation Line

-(instancetype)init {
    
    self = [super init];
   
    if (!_eraser) {
        [self setLineWidth:2.0];
    }
    else {
        [self setLineWidth:20];
    }

    return self;
}

@end
