//
//  ViewController.m
//  AnimationExercise
//
//  Created by Mark Angeles on 9/6/14.
//  Copyright (c) 2014 Chua's Company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    BOOL isAnimating;
    
    CGFloat startAngle;
    CGFloat endAngle;
    int progressValue;
}

@end

@implementation ViewController
@synthesize progressBar = _progressBar;

- (CircleProgress *)progressBar
{
    if (!_progressBar) {
        _progressBar = [[CircleProgress alloc]initWithFrame:CGRectMake(0, 0, 148, 145)];

    }
    return _progressBar;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Set frame!!");
    // +33

    [self.buttonCloud setFrame:CGRectMake((320/2)- (120/2), 300, 130, 130)];
    [self.imageCloud setFrame:CGRectMake(CGRectGetMinX(self.buttonCloud.frame)+25, 125, 58, 38)];
    
    [self.imageBackground.layer setCornerRadius: 75];
    self.imageBackground.layer.borderWidth = 1;
    self.imageBackground.layer.borderColor = [UIColor darkGrayColor].CGColor;
    progressValue = 1;
    [self.labelDownload setFont:[UIFont fontWithName:@"Market Deco" size:20]];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    isAnimating = NO;
    startAngle = M_PI * 1.5;
    endAngle = startAngle + (M_PI * 2);
    
    [self.buttonCloud addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
}


#pragma mark - Sub Functions
- (void)buttonClicked: (UIButton *)sender
{
    
    // Do all animation
    //211 215 227
//    [sender setEnabled:NO];
    if (!isAnimating) {
        
        isAnimating = YES;
        [UIView animateWithDuration:.3 animations:^{
            [self.buttonCloud setFrame:CGRectMake(self.buttonCloud.frame.origin.x + 5, self.buttonCloud.frame.origin.y, self.buttonCloud.frame.size.width, self.buttonCloud.frame.size.height)];
            [self.imageCloud setFrame:CGRectMake(self.imageCloud.frame.origin.x + 5, self.imageCloud.frame.origin.y, self.imageCloud.frame.size.width, self.imageCloud.frame.size.height)];
            [self.imageBackground setFrame:CGRectMake(self.imageBackground.frame.origin.x + 5, self.imageBackground.frame.origin.y, self.imageBackground.frame.size.width - 10, self.imageBackground.frame.size.height)];
            
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2 animations:^{
                [self.buttonCloud setFrame:CGRectMake(self.buttonCloud.frame.origin.x + 60, self.buttonCloud.frame.origin.y, self.buttonCloud.frame.size.width, self.buttonCloud.frame.size.height)];
                [self.imageCloud setFrame:CGRectMake(self.imageCloud.frame.origin.x + 60, self.imageCloud.frame.origin.y, self.imageCloud.frame.size.width, self.imageCloud.frame.size.height)];
                [self.imageBackground setFrame:CGRectMake(self.imageBackground.frame.origin.x + 60, self.imageBackground.frame.origin.y, self.imageBackground.frame.size.width - 120, self.imageBackground.frame.size.height)];
                [self.labelDownload setFrame:CGRectMake(self.labelDownload.frame.origin.x - 30, self.labelDownload.frame.origin.y, self.labelDownload.frame.size.width - 10, self.labelDownload.frame.size.height)];
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:.3 animations:^{
                    
                    [self.buttonCloud setFrame:CGRectMake(self.buttonCloud.frame.origin.x + 5, self.buttonCloud.frame.origin.y, self.buttonCloud.frame.size.width, self.buttonCloud.frame.size.height)];
                    [self.imageCloud setFrame:CGRectMake(self.imageCloud.frame.origin.x + 5, self.imageCloud.frame.origin.y, self.imageCloud.frame.size.width, self.imageCloud.frame.size.height)];
                    [self.imageBackground setFrame:CGRectMake(self.imageBackground.frame.origin.x + 5, self.imageBackground.frame.origin.y, self.imageBackground.frame.size.width - 7, self.imageBackground.frame.size.height)];
                    [self.labelDownload setFrame:CGRectMake(self.labelDownload.frame.origin.x - 10, self.labelDownload.frame.origin.y, 0, self.labelDownload.frame.size.height)];
                    
                } completion:^(BOOL finished) {
                    
                    [self.imageCloud setImage:[UIImage imageNamed:@"Cloud_On"]];
                    [self.imageBackground addSubview:self.progressBar];
                    [self updateProgressBar];
                }];
            }];
        }];
    }
  
    
    
}
- (void)doneAnimating
{
    isAnimating = NO;
    progressValue = 1;
    [self.buttonCloud setFrame:CGRectMake(30, 130, 130, 130)];
    [self.imageBackground setFrame:CGRectMake(18, 120, 285, 145)];
    [self.imageCloud setFrame:CGRectMake(63, 176, 58, 38)];
    [self.labelDownload setFrame:CGRectMake(165, 167, 122, 48)];
    [self.imageCloud setImage:[UIImage imageNamed:@"Cloud_Off"]];
    [self.progressBar removeFromSuperview];
}


- (void)updateProgressBar
{
    
    // Function to add progress.
    // Check if progress is max/finished
    progressValue++;
    self.progressBar.progress = progressValue;
    [self.progressBar setNeedsDisplay];
    NSLog(@"Progress == %d",progressValue);
    if (progressValue == 100) {
        [self performSelector:@selector(doneAnimating) withObject:nil afterDelay:3];
        
    }else{
        [self performSelector:@selector(updateProgressBar) withObject:nil afterDelay:.02];
        
    }
    
    
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
