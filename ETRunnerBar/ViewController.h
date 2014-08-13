//
//  ViewController.h
//  ETRunnerBar
//
//  Created by Ersen Tekin on 18.06.2014.
//  Copyright (c) 2014 Ersen Tekin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETRunnerBar.h"

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (strong, nonatomic) ETRunnerBar* runnerBar;
@property (strong, nonatomic) IBOutlet UICollectionView *mainCollectionView;

@end
