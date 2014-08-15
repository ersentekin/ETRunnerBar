ETRunnerBar
===========

[![CI Status](http://img.shields.io/travis/lansdon/LPAlert.svg?style=flat)](https://travis-ci.org/lansdon/LPAlert)
[![Version](https://img.shields.io/cocoapods/v/LPAlert.svg?style=flat)](http://cocoadocs.org/docsets/LPAlert)
[![License](https://img.shields.io/cocoapods/l/LPAlert.svg?style=flat)](http://cocoadocs.org/docsets/LPAlert)
[![Platform](https://img.shields.io/cocoapods/p/LPAlert.svg?style=flat)](http://cocoadocs.org/docsets/LPAlert)

####Facebook iOS App's animated header bar library.

![alt text](https://github.com/ersentekin/ETRunnerBar/blob/master/Images/form1.jpg "State 1")

![alt text](https://github.com/ersentekin/ETRunnerBar/blob/master/Images/form2.jpg "State 2")

![alt text](https://github.com/ersentekin/ETRunnerBar/blob/master/Images/form3.jpg "State 3")

![alt text](https://github.com/ersentekin/ETRunnerBar/blob/master/Images/form4.jpg "State 4")

You can find an example of the ETRunnerBar usage with ```UICollectionView```.

####Installation

ETRunnerBar is available through CocoaPods. To install it, simply add the following line to your Podfile:

```pod "ETRunnerBar"```


You should initialize and customize if you want, in the viewDidLoad method.

But also you should call these 4 ETRunnerBar methods inside the scrollView delegates to help ETRunnerBar to detect your scrollView's actions.

```objective-c

runnerBar = [[ETRunnerBar alloc] init];

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