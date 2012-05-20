//
//  SBGameFieldView.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBPlayField.h"

@interface SBGameFieldView : UIView

@property (strong, nonatomic) SBPlayField* gameField;
@property (nonatomic) bool visible;

@end
