//
//  SBGameViewController.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBGameViewController.h"
#import "SBNetworkConnection.h"
#import "SBAllCommands.h"
#import "SBGameFieldView.h"
#import "SBGame.h"
#import "SBAppDelegate.h"
#import "QuartzCore/QuartzCore.h"

@interface SBGameViewController ()

@end

@implementation SBGameViewController

@synthesize myGameField, statusLabel, enemyGameField;

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

- (void)redrawGameFields {
  [self.myGameField setNeedsLayout];
  [self.myGameField setNeedsDisplay];
  [self.enemyGameField setNeedsLayout];
  [self.enemyGameField setNeedsDisplay];
}

- (void)updateStatusLabel {
  self.statusLabel.text = ([SBGame sharedInstance].myTurn ? NSLocalizedString(@"MyTurn", @"") : NSLocalizedString(@"EnemyTurn", @""));
}

- (void)onMessageReceived:(SBServerCommand*)command {
  if (command.command == FullUpdate) {
    SBFullUpdateCommand *cmd = (SBFullUpdateCommand*)command;
    if (cmd.myField) {
      [[SBGame sharedInstance].me.playField updateWithStringData:cmd.fieldData];
      [self.myGameField.gameField updateWithStringData:cmd.fieldData];
    } else {
      [[SBGame sharedInstance].enemy.playField updateWithStringData:cmd.fieldData];
      [self.enemyGameField.gameField updateWithStringData:cmd.fieldData];
    }
    
    [SBGame sharedInstance].myTurn = cmd.myTurn;
    [self redrawGameFields];
    [self updateStatusLabel];
  } else if (command.command == PartialUpdate) {
    SBPartialUpdate *cmd = (SBPartialUpdate*)command;
    if (cmd.myField) {
      [[SBGame sharedInstance].me.playField setValue:cmd.value posX:cmd.posX posY:cmd.posY];
      [self.myGameField.gameField setValue:cmd.value posX:cmd.posX posY:cmd.posY];
    } else {
      [[SBGame sharedInstance].enemy.playField setValue:cmd.value posX:cmd.posX posY:cmd.posY];
      [self.enemyGameField.gameField setValue:cmd.value posX:cmd.posX posY:cmd.posY];
    }
    
    [SBGame sharedInstance].myTurn = cmd.myTurn;
    [self redrawGameFields];
    [self updateStatusLabel];
  } else if (command.command == Win) {
    SBWinCommand *cmd = (SBWinCommand*)command;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
    [btn.layer setBorderWidth:1];
    [btn.layer setBorderColor:[UIColor blackColor].CGColor];
    btn.frame = self.statusLabel.frame;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.statusLabel.hidden = YES;
    [btn setTitle:NSLocalizedString(@"ExitLabelText", @"") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onExitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    if (cmd.win) {
      [[[UIAlertView alloc] initWithTitle:@"SeaBattle" message:NSLocalizedString(@"YouWonText", @"") delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
      
      NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
      
      if ([user stringForKey:@"nr wins"] != nil) {
        int wins = [[user stringForKey:@"nr wins"] intValue];
        wins++;
        [user setObject:[NSString stringWithFormat:@"%d", wins] forKey:@"nr wins"];
      } else {
        [user setObject:@"1" forKey:@"nr wins"];
      }
    } else {
      [[[UIAlertView alloc] initWithTitle:@"SeaBattle" message:NSLocalizedString(@"YouLostText", @"") delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
      
      NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
      
      if ([user stringForKey:@"nr losses"] != nil) {
        int losses = [[user stringForKey:@"nr losses"] intValue];
        losses++;
        [user setObject:[NSString stringWithFormat:@"%d", losses] forKey:@"nr losses"];
      } else {
        [user setObject:@"1" forKey:@"nr losses"];
      }
    }
    
    enemyGameField.hideShips = NO;
  }
}

- (void)onExitButtonClick:(id)sender {
  SBAppDelegate *delegate = (SBAppDelegate *)[UIApplication sharedApplication].delegate;
  [delegate showMainWindow];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 100)];
  self.statusLabel.textAlignment = UITextAlignmentCenter;
  self.statusLabel.font = [UIFont systemFontOfSize:20];
  [self.view addSubview:statusLabel];
  
  self.myGameField = [[SBGameFieldView alloc] initWithFrame:CGRectMake(220, 0, 100, 100)];
  self.myGameField.gameField = [SBGame sharedInstance].me.playField;
  self.myGameField.hideShips = NO;
  [self.myGameField.layer setBorderWidth:1.0f];
  [self.myGameField.layer setBorderColor:[UIColor blackColor].CGColor];
  [self.view addSubview:myGameField];
  
  self.enemyGameField = [[SBGameFieldView alloc] initWithFrame:CGRectMake(0, 100, 320, 320)];
  self.enemyGameField.gameField = [SBGame sharedInstance].enemy.playField;
  self.enemyGameField.hideShips = YES;  
  [self.enemyGameField.layer setBorderWidth:1.0f];
  [self.enemyGameField.layer setBorderColor:[UIColor blackColor].CGColor];
  [self.view addSubview:enemyGameField];
  
  [self updateStatusLabel];
  [self redrawGameFields];	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  if (![SBGame sharedInstance].myTurn) return;
  
  if (event.type == UIEventTypeTouches) {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.enemyGameField];
    if (location.x >= 0 && location.x <= 320 && location.y >= 0 && location.y <= 320) {
      int posX, posY;
      posX = location.x / (self.enemyGameField.frame.size.width / [SBGame size]);
      posY = location.y / (self.enemyGameField.frame.size.width / [SBGame size]);
      
      int value = [[SBGame sharedInstance].enemy.playField valueOfColumn:posX row:posY];
      if (value == VALUE_FREE || value == VALUE_SHIP) {
        SBPlayerShoot *cmd = [[SBPlayerShoot alloc] initWithPosX:posX PosY:posY];
        [[SBNetworkConnection sharedInstance] sendCommand:cmd];
        [SBGame sharedInstance].myTurn = NO;
        self.statusLabel.text = NSLocalizedString(@"WaitingForServerLabelText", @"");
      }
    }
  }
}

@end
