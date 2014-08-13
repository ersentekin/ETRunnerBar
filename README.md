ETRunnerBar
===========

####Facebook iOS App like top and bottom header bar

You can find an example of the ETRunnerBar usage with ```UICollectionView```.

You should initialize and customize if you want, in the viewDidLoad method.

But also you should call these 4 ETRunnerBar methods inside the scrollView delegates to help ETRunnerBar to detect your scrollView's actions.

```objective-c
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
```