//
//  SBViewController.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnStartSearching;
@property (weak, nonatomic) IBOutlet UIButton *btnPreferences;

- (IBAction)buttonOnlineBattlePressed:(UIButton *)sender;
- (IBAction)buttonPreferencesPressed:(UIButton *)sender;

@end
