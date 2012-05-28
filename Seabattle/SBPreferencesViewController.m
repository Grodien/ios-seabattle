//
//  SBPreferencesViewController.m
//  Seabattle
//
//  Created by remo blättler on 16.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPreferencesViewController.h"

@interface SBPreferencesViewController ()

@end

@implementation SBPreferencesViewController

@synthesize textFieldUsername;
@synthesize labelWins;
@synthesize labelLosses;
@synthesize labelPreferences;
@synthesize user;
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
    
    NSUserDefaults *usernameText = [NSUserDefaults standardUserDefaults];
    NSString *savedUsername = [usernameText stringForKey:@"Username Text"];
    textFieldUsername.text = savedUsername;

    user = [SBUser sharedSBUser];
    textFieldUsername.text = user.username;
}

- (void)viewDidUnload
{
    [self setLabelPreferences:nil];
    [self setLabelusername:nil];
    [self setLabelPreferences:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    user.username = textFieldUsername.text;
    NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
    [usernameDefault setObject:textFieldUsername.text forKey:@"Username Text"];
    
    [textField resignFirstResponder];
    return YES;
}

@end
