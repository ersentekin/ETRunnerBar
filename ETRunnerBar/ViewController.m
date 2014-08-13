//
//  ViewController.m
//  ETRunnerBar
//
//  Created by Ersen Tekin on 18.06.2014.
//  Copyright (c) 2014 Ersen Tekin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize runnerBar, mainCollectionView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    runnerBar = [[ETRunnerBar alloc] init];
    runnerBar.topView.backgroundColor = [UIColor darkGrayColor];
    runnerBar.bottomView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:runnerBar];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainCell" forIndexPath:indexPath];
    
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [runnerBar ETScrollViewWillBeginDragging:scrollView];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [runnerBar ETScrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [runnerBar ETScrollViewDidEndDecelerating:scrollView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [runnerBar ETScrollViewDidScroll:scrollView];
    
}

@end
