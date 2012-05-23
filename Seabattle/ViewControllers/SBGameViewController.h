//
//  SBGameViewController.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBGameFieldView;

@interface SBGameViewController : UIViewController

@property (strong, nonatomic) UILabel* statusLabel;
@property (strong, nonatomic) SBGameFieldView* myGameField;
@property (strong, nonatomic) SBGameFieldView* enemyGameField;

- (void)updateStatusLabel;
- (void)redrawGameFields;

@end
