//
//  SBViewController.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBViewController.h"
#import "SBQueueViewController.h"
#import "SBNetworkConnection.h"
#import "SBAppDelegate.h"

@interface SBViewController ()

@end

@implementation SBViewController
@synthesize btnStartSearching;
@synthesize btnPreferences;

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.btnStartSearching setTitle:NSLocalizedString(@"btnStartSearchingTitle", @"") forState:UIControlStateNormal];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBtnStartSearching:nil];
    [self setBtnPreferences:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonOnlineBattlePressed:(UIButton *)sender {
 
  SBAppDelegate *delegate = (SBAppDelegate *)[UIApplication sharedApplication].delegate;
  [delegate showQueueWindow];

}

- (IBAction)buttonPreferencesPressed:(UIButton *)sender {
    SBAppDelegate *delegate = (SBAppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate showPreferencesWindow];
}
@end
