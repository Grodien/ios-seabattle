//
//  SBPreferencesViewController.h
//  Seabattle
//
//  Created by remo blättler on 16.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBPreferencesViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelPreferences;
@property (weak, nonatomic) IBOutlet UILabel *labelusername;
@property (strong, nonatomic) IBOutlet UITextField *textFieldUsername;

@property (strong, nonatomic) IBOutlet UILabel *labelWins;
@property (weak, nonatomic) IBOutlet UILabel *labelNrWins;
@property (strong, nonatomic) IBOutlet UILabel *labelLosses;
@property (weak, nonatomic) IBOutlet UILabel *labelNrLosses;
- (IBAction)buttonOKPressed:(UIButton *)sender;
@end
