//
//  ViewController.m
//  ExclusionPath
//
//  Created by BeyondVincent on 13-6-25.
//  Copyright (c) 2013年 BeyondVincent. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) CGPoint gestureStartingPoint;
@property (nonatomic) CGPoint gestureStartingCenter;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建一个平移手势对象，该对象可以调用imagePanned：方法
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(imagePanned:)];
    [self.imageView addGestureRecognizer:panGes];
    
    self.textView.textContainer.exclusionPaths = @[[self translatedBezierPath]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIBezierPath *)translatedBezierPath
{
    CGRect butterflyImageRect = [self.textView convertRect:self.imageView.frame fromView:self.view];
    UIBezierPath *newButterflyPath = [UIBezierPath bezierPathWithRect:butterflyImageRect];
    
    return newButterflyPath;
}

- (void)imagePanned:(id)sender
{
    if ([sender isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *localSender = sender;
        
        if (localSender.state == UIGestureRecognizerStateBegan) {
            self.gestureStartingPoint = [localSender translationInView:self.textView];
            self.gestureStartingCenter = self.imageView.center;
        } else if (localSender.state == UIGestureRecognizerStateChanged) {
            CGPoint currentPoint = [localSender translationInView:self.textView];
            
            CGFloat distanceX = currentPoint.x - self.gestureStartingPoint.x;
            CGFloat distanceY = currentPoint.y - self.gestureStartingPoint.y;
            
            CGPoint newCenter = self.gestureStartingCenter;
            
            newCenter.x += distanceX;
            newCenter.y += distanceY;
            
            self.imageView.center = newCenter;
            
            self.textView.textContainer.exclusionPaths = @[[self translatedBezierPath]];
        } else if (localSender.state == UIGestureRecognizerStateEnded) {
            self.gestureStartingPoint = CGPointZero;
            self.gestureStartingCenter = CGPointZero;
        }
    }
}

@end
