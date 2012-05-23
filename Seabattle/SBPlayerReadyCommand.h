//
//  SBPlayerReadyCommand.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBServerCommand.h"

@interface SBPlayerReadyCommand : SBServerCommand
@property (nonatomic, readonly) bool ready;
@property (nonatomic, readonly) bool startGame;
@property (nonatomic, readonly) bool myTurn;

@end
