//
//  SBErrorCommand.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBServerCommand.h"

#define ERROR_CODE_PLAYER_DISCONNECT 1

@interface SBErrorCommand : SBServerCommand
@property (nonatomic, readonly) int errorCode;

@end
