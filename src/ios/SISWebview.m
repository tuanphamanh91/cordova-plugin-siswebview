/********* SISWebview.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <WebKit/WebKit.h>

#define ROOTVIEW [[[UIApplication sharedApplication] keyWindow] rootViewController]

@interface SISWebview : CDVPlugin {
  // Member variables go here.
    UIView *blackView;
    UIWebView *_webView;
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)removeWebview;
@end

@implementation SISWebview

- (void)removeWebview {
    [blackView removeFromSuperview];
    [_webView removeFromSuperview];
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    NSDictionary *options = [command.arguments objectAtIndex:0];
    NSString *urlStr = options[@"url"] ?: nil;
    NSLog(@"url: %@", urlStr);
    NSURL *targetURL = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    
    blackView = [[UIView alloc] initWithFrame:ROOTVIEW.view.frame];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.8;
    
    _webView = [[UIWebView alloc] init];
    [_webView loadRequest:request];
    
    [ROOTVIEW.view addSubview:blackView];
    [ROOTVIEW.view addSubview:_webView];
    _webView.translatesAutoresizingMaskIntoConstraints = false;
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem: _webView
                                  attribute: NSLayoutAttributeLeading
                                  relatedBy: NSLayoutRelationEqual
                                     toItem: ROOTVIEW.view
                                  attribute: NSLayoutAttributeLeading
                                 multiplier: 1.0f
                                   constant: 20.f];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem: _webView
                                  attribute: NSLayoutAttributeTop
                                  relatedBy: NSLayoutRelationEqual
                                     toItem: ROOTVIEW.view
                                  attribute: NSLayoutAttributeTop
                                 multiplier: 1.0f
                                   constant: 50.f];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem: _webView
                                  attribute: NSLayoutAttributeTrailing
                                  relatedBy: NSLayoutRelationEqual
                                     toItem: ROOTVIEW.view
                                  attribute: NSLayoutAttributeTrailing
                                 multiplier: 1.0f
                                   constant: -20.f];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem: _webView
                                  attribute: NSLayoutAttributeBottom
                                  relatedBy: NSLayoutRelationEqual
                                     toItem: ROOTVIEW.view
                                  attribute: NSLayoutAttributeBottom
                                 multiplier: 1.0f
                                   constant: -50.f];
    
    [ROOTVIEW.view addConstraint:leading];
    [ROOTVIEW.view addConstraint:top];
    [ROOTVIEW.view addConstraint:trailing];
    [ROOTVIEW.view addConstraint:bottom];
}

@end
