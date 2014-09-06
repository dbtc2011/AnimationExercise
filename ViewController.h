//
//  ViewController.h
//  AnimationExercise
//
//  Created by Mark Angeles on 9/6/14.
//  Copyright (c) 2014 Chua's Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CircleProgress.h"
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *buttonCloud;
@property (strong, nonatomic) IBOutlet UIImageView *imageCloud;
@property (strong, nonatomic) IBOutlet UIImageView *imageBackground;
@property (strong, nonatomic) IBOutlet UILabel *labelDownload;

@property (strong, nonatomic) CircleProgress *progressBar;

@end
