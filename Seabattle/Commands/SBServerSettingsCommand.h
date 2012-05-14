//
//  SBServerSettingsCommand.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBServerCommand.h"

@interface SBServerSettingsCommand : SBServerCommand

@property (nonatomic, readonly) int SIZE;
@property (nonatomic, readonly) int SMALL_SHIP_COUNT;
@property (nonatomic, readonly) int MEDIUM_SHIP_COUNT;
@property (nonatomic, readonly) int BIG_SHIP_COUNT;
@property (nonatomic, readonly) int HUGE_SHIP_COUNT;
@property (nonatomic, readonly) int ULTIMATE_SHIP_COUNT;

@end
