//
//  ViewController.m
//  Fastest_Rpm_w2d4
//
//  Created by Sunny Surdhar on 2015-05-14.
//  Copyright (c) 2015 Sunny Surdhar. All rights reserved.
//

#import "ViewController.h"


#define START_ANGLE 135 * (M_PI/180)
#define END_ANGLE (135-90) * (M_PI/180)
#define MID_ANGLE (135+135) * (M_PI/180)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *needle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation( START_ANGLE );
    [self.needle setTransform:rotate];
    
    UIPanGestureRecognizer *swipeGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    swipeGesture.delegate = self;
    [self.view addGestureRecognizer:swipeGesture];
//    self.needle.gestureRecognizers = panGesture;
    
//    UITapGestureRecognizer *needle 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (void)panGesture:(UIPanGestureRecognizer *)gesture {
    
    NSLog(@"It works!!!!!");
    
    CGPoint velocity = [gesture velocityInView:self.view];
    CGFloat averageVelocity = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y));
//    CGFloat angle = (((averageVelocity/maxVelocity)*270)+135);
    
    if ([gesture state] == UIGestureRecognizerStateBegan) {
        CGAffineTransform rotate = CGAffineTransformMakeRotation(START_ANGLE);
        [self.needle setTransform:rotate];
    }else if ([gesture state] == UIGestureRecognizerStateChanged) {
        if (averageVelocity >= 400.0) {
            CGAffineTransform rotate = CGAffineTransformMakeRotation(END_ANGLE);
            [self.needle setTransform:rotate];
        } else if (averageVelocity >=200.0) {
            CGAffineTransform rotate = CGAffineTransformMakeRotation(MID_ANGLE);
            [self.needle setTransform:rotate];
        }
//        else if (averageVelocity >=100) {
//            CGAffineTransform rotate = CGAffineTransformMakeRotation((135+90) * (M_PI/180));
//            [self.needle setTransform:rotate];
//        } else if (averageVelocity >=300) {
//            CGAffineTransform rotate = CGAffineTransformMakeRotation((135+180) * (M_PI/180));
//            [self.needle setTransform:rotate];
//        }
        else {
        [gesture state] == UIGestureRecognizerStateEnded;
        CGAffineTransform rotate = CGAffineTransformMakeRotation( (START_ANGLE) );
        [self.needle setTransform:rotate];
        }
    
    }
}

@end
