//
//  ViewController.m
//  BVGravityBehavior
//
//  Created by BeyondVincent on 13-6-15.
//  Copyright (c) 2013年 BeyondVincent. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *square1;
@property (nonatomic) UIDynamicAnimator* animator;

- (IBAction)startGravity:(id)sender;
- (IBAction)stopGravity:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 开始重力行为
- (IBAction)startGravity:(id)sender
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior* gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[self.square1]];
    [self.animator addBehavior:gravityBeahvior];
}

// 停止重力行为
- (IBAction)stopGravity:(id)sender
{
    [self.animator removeAllBehaviors];
}

@end
