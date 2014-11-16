//
//  WebViewController.m
//  TicTacToe
//
//  Created by Dave Krawczyk on 9/3/14.
//  Copyright (c) 2014 Dave Krawczyk. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@property (nonatomic) CGFloat previousOffset;
@end


@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.eventURL];
    [self.webView loadRequest:request];
}


- (void)updateButtons
{
    self.backButton.enabled = self.webView.canGoBack;
    self.forwardButton.enabled = self.webView.canGoForward;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self updateButtons];
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self.activityIndicator stopAnimating];
}
- (IBAction)doneButtonTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backButtonPressed:(id)sender
{
    
    [self.webView goBack];
    [self updateButtons];
    
}

- (IBAction)forwardButtonPressed:(id)sender
{
    
    [self.webView goForward];
    [self updateButtons];
    
}


@end
