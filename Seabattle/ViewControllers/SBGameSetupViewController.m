//
//  SBGameSetupViewController.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBGameSetupViewController.h"
#import "SBAllCommands.h"
#import "SBNetworkConnection.h"
#import "QuartzCore/QuartzCore.h"
#import "SBGame.h"
#import "SBPlayField.h"
#import "SBGameFieldView.h"
#import "SBAppDelegate.h"

@interface SBGameSetupViewController ()

@end

@implementation SBGameSetupViewController
@synthesize gameFieldView;
@synthesize enemyLabel;
@synthesize enemyReadyStateLabel;
@synthesize renewButton;
@synthesize readyButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.gameFieldView = [[SBGameFieldView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
  self.gameFieldView.hideShips = NO;
  self.gameFieldView.gameField = [SBGame sharedInstance].me.playField;
  [self.view addSubview:self.gameFieldView];
  
  self.enemyLabel.text = [NSString stringWithFormat:NSLocalizedString(@"EnemyLabel", @""), [SBGame sharedInstance].enemy.name];
  [self.renewButton setTitle:NSLocalizedString(@"renewGameFieldButtonTitle", @"") forState:UIControlStateNormal];
  [self.readyButton setTitle:NSLocalizedString(@"ReadyButtonTitleState1", @"") forState:UIControlStateNormal];
  
  
  [self drawPlayField];
}

- (void)viewDidUnload
{
  [self setEnemyLabel:nil];
  [self setEnemyReadyStateLabel:nil];
  [self setRenewButton:nil];
  [self setReadyButton:nil];
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
  [[SBNetworkConnection sharedInstance] subscribeMessageReceived:self withSelector:@selector(onMessageReceived:)];
}


- (void)viewWillDisappear:(BOOL)animated {
  [[SBNetworkConnection sharedInstance] unsubscribeMessageReceived:self withSelector:@selector(onMessageReceived:)];
}

- (void)onMessageReceived:(SBServerCommand*)command {
  if (command.command == PlayerReady) {
    SBGame *game = [SBGame sharedInstance];
    SBPlayerReadyCommand *cmd = (SBPlayerReadyCommand*)command;
    game.enemy.ready = cmd.ready;
    
    if (game.enemy.ready) {
      enemyReadyStateLabel.text = NSLocalizedString(@"ReadyStateReady", @"");
      enemyReadyStateLabel.textColor = [UIColor greenColor];
    } else {
      enemyReadyStateLabel.text = NSLocalizedString(@"ReadyStateNotReady", @"");
      enemyReadyStateLabel.textColor = [UIColor redColor];
    }
    
    if (cmd.startGame) {
      [SBGame sharedInstance].myTurn = cmd.myTurn;
      
      SBAppDelegate *delegate = (SBAppDelegate *)[UIApplication sharedApplication].delegate;
      [delegate showGameWindow];
    }    
    
  } else if (command.command == FullUpdate) {
    SBPlayField *field = [[SBPlayField alloc] initWithString:((SBFullUpdateCommand*)command).fieldData];
    [SBGame sharedInstance].me.playField = field;
    self.gameFieldView.gameField = field;
    [self drawPlayField];
  } else if (command.command == Error) {
    SBErrorCommand* cmd = (SBErrorCommand*)command;
    if (cmd.errorCode == ERROR_CODE_PLAYER_DISCONNECT) {
      [[[UIAlertView alloc] initWithTitle:@"SeaBattle" message:NSLocalizedString(@"ErrorPlayerDisconnectedText", @"") delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
  } else if (command.command == PlayerFound) {
    [SBGame sharedInstance].enemy.name = ((SBPlayerFound*)command).playerName;
  }
}

- (void)drawPlayField {
  [self.gameFieldView setNeedsLayout];
  [self.gameFieldView setNeedsDisplay];
}

- (IBAction)onRenewButtonClick:(UIButton *)sender {
  SBRenewGameFieldCommand *cmd = [[SBRenewGameFieldCommand alloc] init]; 
  [[SBNetworkConnection sharedInstance] sendCommand:cmd];
}

- (IBAction)onReadyButtonClick:(UIButton *)sender {
  SBGame *game = [SBGame sharedInstance];
  game.me.ready = !game.me.ready;
  
  SBReadyCommand *cmd = [[SBReadyCommand alloc] initWithReadyState:game.me.ready];
  [[SBNetworkConnection sharedInstance] sendCommand:cmd];
  
  if (game.me.ready) {
    [sender setTitle:NSLocalizedString(@"ReadyButtonTitleState2", @"") forState:UIControlStateNormal];
  } else {
    [sender setTitle:NSLocalizedString(@"ReadyButtonTitleState1", @"") forState:UIControlStateNormal];
  }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex; {
  SBAppDelegate *delegate = (SBAppDelegate *)[UIApplication sharedApplication].delegate;
  [[SBNetworkConnection sharedInstance] disconnect];
  [delegate showMainWindow];
}
@end
