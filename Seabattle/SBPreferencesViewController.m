//
//  SBPreferencesViewController.m
//  Seabattle
//
//  Created by remo blättler on 16.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPreferencesViewController.h"
#import "SBAppDelegate.h"
#import "SBGame.h"
#import "SBPlayer.h"

@interface SBPreferencesViewController ()

@end

@implementation SBPreferencesViewController

@synthesize textFieldUsername;
@synthesize labelWins;
@synthesize labelLosses;
@synthesize labelNrWins;
@synthesize labelNrLosses;
@synthesize labelPreferences;
@synthesize labelusername;

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
    // Do any additional setup after loading the view from its nib.
    labelPreferences.text = NSLocalizedString(@"PreferencesLabel", @"");
    labelusername.text = NSLocalizedString(@"usernamelabel", @"");
    labelWins.text = NSLocalizedString(@"winsLabel", @"");
    labelLosses.text = NSLocalizedString(@"lossesLabel", @"");
    
    [textFieldUsername setDelegate:self];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    textFieldUsername.text = [user stringForKey:@"Username"];
    
    //NSUserDefaults *nrWins = [NSUserDefaults standardUserDefaults];
    //NSUserDefaults *nrLosses = [NSUserDefaults standardUserDefaults];

    if ([user stringForKey:@"nr wins"] != nil) {
        labelNrWins.text = [user stringForKey:@"nr wins"];
    }
    if ([user stringForKey:@"nr losses"] != nil) {
        labelNrLosses.text = [user stringForKey:@"nr losses"];
    }
    
}

- (void)viewDidUnload
{
    [self setLabelPreferences:nil];
    [self setLabelusername:nil];
    [self setLabelPreferences:nil];
    [self setLabelNrWins:nil];
    [self setLabelNrLosses:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
  
  NSString* name = textFieldUsername.text;
  
    NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
    [usernameDefault setObject:name forKey:@"Username"];
  
  if (name != nil) {
    [SBGame sharedInstance].me.name = name;
  } else {
    [SBGame sharedInstance].me.name = NSLocalizedString(@"NameUnknown", @"");
  }
    
  [textField resignFirstResponder];
  return YES;
}

- (IBAction)buttonOKPressed:(UIButton *)sender {
    SBAppDelegate *delegate = (SBAppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate showMainWindow];
}
@end
