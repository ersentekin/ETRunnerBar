//
//  ETRunnerBar.h
//  ETRunnerBar
//
//  Created by Ersen Tekin on 18.06.2014.
//  Copyright (c) 2014 Ersen Tekin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETRunnerBar : UIView {
    CGRect rectTopView;
    CGRect rectBottomView;
    CGRect screenRect;
    float selfX, selfY, selfWidth, selfHeight;
    float prevOffsetY;
    float prevStartOffsetY;
    
}

@property (strong, nonatomic) UIView* topView;
@property (strong, nonatomic) UIView* bottomView;

// bufferDistanceToFlushOut : use to put delay before the bar show up when sliding down
// set it in pixels as distance (min = 0, default = 50)
@property float bufferDistanceToFlushOut;

// slideIntensity : you can make sliding action fast (max: sync with mainScroll) or slow
// (min = 0, max = 1, default = 0.7)
@property float slideIntensity;

-(void)ETScrollViewDidScroll:(UIScrollView *)scrollView;
-(void)ETScrollViewDidEndDecelerating:(UIScrollView *)scrollView;
-(void)ETScrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
-(void)ETScrollViewWillBeginDragging:(UIScrollView *)scrollView;

@end
