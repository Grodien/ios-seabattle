//
//  SBPlayer.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBPlayField.h"

@interface SBPlayer : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) SBPlayField *playField;
@property (nonatomic) bool ready;

- (id)initWithName:(NSString*)pName;
- (id)initMySelf;
- (id)initWithUserDefault;

@end
