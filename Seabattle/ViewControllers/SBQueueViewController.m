//
//  SBQueueViewController.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBQueueViewController.h"
#import "SBNetworkConnection.h"
#import "SBUpdateNameCommand.h"
#import "SBGame.h"
#import "SBAllCommands.h"
#import "SBGameSetupViewController.h"
#import "SBAppDelegate.h"

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

- (void)viewDidAppear:(BOOL)animated {
  [[SBNetworkConnection sharedInstance] connect];
  [[SBNetworkConnection sharedInstance] sendCommand:[[SBUpdateNameCommand alloc] initWithName:[SBGame sharedInstance].me.name]];
  [activityIndicator startAnimating];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
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

- (void)onMessageReceived:(SBServerCommand*)command {
  if (command.command == ServerSettings) {
    [SBGame size:((SBServerSettingsCommand*)command).SIZE];
  } else if (command.command == PlayerFound) {
    SBGame* game = [SBGame sharedInstance];
    game.enemy = [[SBPlayer alloc] init];
    game.enemy.name = ((SBPlayerFound*)command).playerName;
    
    SBAppDelegate *delegate = (SBAppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate showGameSetupWindow];
  } else if (command.command == FullUpdate) {
    SBPlayField *field = [[SBPlayField alloc] initWithString:((SBFullUpdateCommand*)command).fieldData];
    [SBGame sharedInstance].me.playField = field;
  }
}

- (IBAction)onCancelClick:(UIButton *)sender {
  [[SBNetworkConnection sharedInstance] disconnect];
  [self dismissModalViewControllerAnimated:YES];
}
@end
