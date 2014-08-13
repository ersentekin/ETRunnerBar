//
//  ETRunnerBar.m
//  ETRunnerBar
//
//  Created by Ersen Tekin on 18.06.2014.
//  Copyright (c) 2014 Ersen Tekin. All rights reserved.
//

#import "ETRunnerBar.h"

#define DEF_TOPVIEW_HEIGHT 70
#define DEF_BOTTOMVIEW_HEIGHT 50
#define DEF_X 0
#define DEF_Y 0
#define DEF_SLIDE_INTENSITY 0.5
#define DEF_BUFFER 100
#define DEF_STATUS_BAR_HEIGHT 20

@implementation ETRunnerBar

@synthesize topView, bottomView;
@synthesize bufferDistanceToFlushOut, slideIntensity;

-(id)init {
    
    self = [super init];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

-(void)commonInit {
    // SELF VIEW
    screenRect = [[UIScreen mainScreen] bounds];
    selfX = DEF_X;
    selfY = DEF_Y;
    selfWidth = screenRect.size.width;
    selfHeight = DEF_TOPVIEW_HEIGHT + DEF_BOTTOMVIEW_HEIGHT;
    
    // BOTTOM VIEW
    rectBottomView = CGRectMake(0, DEF_TOPVIEW_HEIGHT, selfWidth, DEF_BOTTOMVIEW_HEIGHT);
    bottomView = [[UIView alloc] initWithFrame:rectBottomView];
    [self addSubview:bottomView];
    
    // TOP VIEW
    rectTopView = CGRectMake(0, 0, selfWidth, DEF_TOPVIEW_HEIGHT);
    topView = [[UIView alloc] initWithFrame:rectTopView];
    [self addSubview:topView];
    
    slideIntensity = DEF_SLIDE_INTENSITY;
    bufferDistanceToFlushOut = DEF_BUFFER;
}

-(void)ETScrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint currentContentOffset = scrollView.contentOffset;
    
    float absDiffOffset = abs(prevStartOffsetY - scrollView.contentOffset.y);
    
    if (absDiffOffset > bufferDistanceToFlushOut && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height) && scrollView.contentOffset.y > 0) {
        
        rectBottomView = bottomView.frame;
        rectTopView = topView.frame;
        
        if (prevOffsetY < currentContentOffset.y) {
            
            // BAR GOES UP
            
            rectBottomView.origin.y = MAX(-(rectBottomView.size.height) + DEF_STATUS_BAR_HEIGHT, rectBottomView.origin.y + (prevOffsetY - scrollView.contentOffset.y) * slideIntensity);
            rectTopView.origin.y = MIN(0, rectBottomView.origin.y - DEF_STATUS_BAR_HEIGHT);

        } else {
            
            rectTopView.origin.y = MIN(0, rectTopView.origin.y + (prevOffsetY - scrollView.contentOffset.y) * slideIntensity);
            rectBottomView.origin.y = MIN(rectTopView.size.height, rectBottomView.origin.y + (prevOffsetY - scrollView.contentOffset.y) * slideIntensity);

        }
        
        [bottomView setFrame:rectBottomView];
        [topView setFrame:rectTopView];
        
    }
    
    prevOffsetY = currentContentOffset.y;
}

-(void)ETScrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self stickBarView];
}

-(void)ETScrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self stickBarView];
    }
}

-(void)ETScrollViewWillBeginDragging:(UIScrollView *)scrollView {
    prevStartOffsetY = scrollView.contentOffset.y;
}

-(void)stickBarView {
    if (rectTopView.origin.y < 0) {
        
        rectBottomView.origin.y = -(rectBottomView.size.height) + DEF_STATUS_BAR_HEIGHT;
        rectTopView.origin.y = rectBottomView.origin.y - DEF_STATUS_BAR_HEIGHT;
        [UIView animateWithDuration:0.25 animations:^{
            [topView setFrame:rectTopView];
            [bottomView setFrame:rectBottomView];
        }];
    } else if (rectBottomView.origin.y < rectTopView.size.height && rectBottomView.origin.y > (rectTopView.size.height - rectBottomView.size.height)) {
        rectBottomView.origin.y = rectTopView.size.height;
        [UIView animateWithDuration:0.25 animations:^{
            [bottomView setFrame:rectBottomView];
        }];
    }
}

-(CGRect)animateViewWithRect:(CGRect)rect isSlideUp:(BOOL) isSlideUp{

    return rect;
}

@end
