//
//  ViewController.m
//  MoveView
//
//  Created by Ken on 2017/2/19.
//  Copyright © 2017年 AIA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *KView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
// 个人感觉这个比较好
//    [self move1];
    
    //小按钮还行，大的块  就能看到是以中心点来移动
    [self move2];

}

- (void)move2
{
    UIPanGestureRecognizer *pan2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan2:)];
    [self.KView addGestureRecognizer:pan2];
}

- (void)pan2:(UIPanGestureRecognizer *)pan
{
    CGPoint location = [pan locationInView:self.KView.superview];

    
    
    if (pan.state != UIGestureRecognizerStateEnded && pan.state != UIGestureRecognizerStateFailed)
    {
        pan.view.center = location;
    }
}


- (void)move1
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.KView addGestureRecognizer:pan];
    
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint currentP = [pan translationInView:self.KView];
    
    self.KView.transform = CGAffineTransformTranslate(self.KView.transform, currentP.x, currentP.y);
    
    [pan setTranslation:CGPointZero inView:self.KView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
