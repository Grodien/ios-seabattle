//
//  SBGameSetupViewController.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBGameFieldView;

@interface SBGameSetupViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *enemyLabel;
@property (weak, nonatomic) IBOutlet UILabel *enemyReadyStateLabel;
@property (weak, nonatomic) IBOutlet UIButton *renewButton;
@property (weak, nonatomic) IBOutlet UIButton *readyButton;
@property (strong, nonatomic) SBGameFieldView* gameFieldView;

- (IBAction)onRenewButtonClick:(UIButton *)sender;
- (IBAction)onReadyButtonClick:(UIButton *)sender;

- (void)drawPlayField;
@end
