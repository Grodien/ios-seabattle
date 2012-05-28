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

- (IBAction)buttonOnlineBattlePressed:(UIButton *)sender;

@end
