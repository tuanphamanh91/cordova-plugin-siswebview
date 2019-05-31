/********* SISWebview.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <WebKit/WebKit.h>

#define ROOTVIEW [[[UIApplication sharedApplication] keyWindow] rootViewController]

@interface SISWebview : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation SISWebview

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    NSDictionary *options = [command.arguments objectAtIndex:0];
    NSString *urlStr = options[@"url"] ?: nil;
    NSLog(@"url: %@", urlStr);
    UIView *blackView = [[UIView alloc] initWithFrame:ROOTVIEW.view.frame];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.8;
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(20, 40, 330, 530) configuration:theConfiguration];
    NSURL *targetURL = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [webView loadRequest:request];
    
    [ROOTVIEW.view addSubview:blackView];
    [ROOTVIEW.view addSubview:webView];
}

@end
