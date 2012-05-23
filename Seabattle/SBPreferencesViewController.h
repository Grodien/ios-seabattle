//
//  SBPreferencesViewController.h
//  Seabattle
//
//  Created by remo blättler on 16.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBUser.h"

@interface SBPreferencesViewController : UIViewController

@property (strong, nonatomic) SBUser *user;

@property (strong, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (strong, nonatomic) IBOutlet UILabel *labelWins;
@property (strong, nonatomic) IBOutlet UILabel *labelLosses;

@end
