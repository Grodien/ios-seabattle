//
//  SBPlayerFound.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBServerCommand.h"

@interface SBPlayerFound : SBServerCommand

@property (nonatomic, readonly) NSString* playerName;

@end
