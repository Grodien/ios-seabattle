//
//  SBQueueViewController.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBQueueViewController.h"
#import "SBNetworkConnection.h"

@interface SBQueueViewController ()

@end

@implementation SBQueueViewController
@synthesize statusLabel;
@synthesize activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
  [[SBNetworkConnection sharedInstance] subscribeMessageReceived:self withSelector:@selector(onMessageReceived:)];
}

- (void)viewWillDisappear:(BOOL)animated {
  [[SBNetworkConnection sharedInstance] unsubscribeMessageReceived:self withSelector:@selector(onMessageReceived:)];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [[SBNetworkConnection sharedInstance] connect];
  [activityIndicator startAnimating];
}

- (void)viewDidUnload
{
  [self setActivityIndicator:nil];
  [self setStatusLabel:nil];
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)onMessageReceived:(id)command {
  
}

- (IBAction)onCancelClick:(UIButton *)sender {
  [[SBNetworkConnection sharedInstance] disconnect];
  [self dismissModalViewControllerAnimated:YES];
}
@end
