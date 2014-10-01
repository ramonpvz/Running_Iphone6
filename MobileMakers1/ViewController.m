//
//  ViewController.m
//  MobileMakers1
//
//  Created by GLBMXM0002 on 9/30/14.
//  Copyright (c) 2014 GLBMXM0002. All rights reserved.
//

#import "ViewController.h"
#define HOME_URL @"http://www.mobilemakers.co"

@interface ViewController () <UIWebViewDelegate , UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
//    NSString *urlString = @"http://www.mobilemakers.co";
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:urlRequest];
//    [self loadURLString:@"http://www.mobilemakers.co"];
    [self loadHomePage];

}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.title = @"Bad Error... No Biscuit";
    alertView.message = error.localizedDescription;
    [alertView addButtonWithTitle:@"That sucks!!!!!!!!!!!!"];
    [alertView addButtonWithTitle:@"Go Home"];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *urlString = @"http://www.google.com";
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:urlRequest];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *urlString = textField.text;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    return YES;
}

- (void) loadURLString: (NSString *) urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void) loadHomePage {
    [self loadURLString:HOME_URL];
}



@end
