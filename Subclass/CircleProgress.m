//
//  CircleProgress.m
//  AnimationExercise
//
//  Created by Mark Angeles on 9/6/14.
//  Copyright (c) 2014 Chua's Company. All rights reserved.
//

#import "CircleProgress.h"

@implementation CircleProgress
@synthesize progress;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        startAngle= M_PI * 1.5;
        endAngle = startAngle + (M_PI * 2);
        self.progress = 10;

        [self setNeedsDisplay];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSLog(@"PROGRESS == %d",self.progress);
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake((rect.size.width/2)-1, rect.size.height/2) radius:65 startAngle:startAngle endAngle:(endAngle - startAngle)*(self.progress / 100.0) + startAngle clockwise:YES];
    bezierPath.lineWidth = 16;
    [[UIColor yellowColor] setStroke];
    [bezierPath stroke];
    
}


@end
