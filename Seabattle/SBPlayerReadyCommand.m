//
//  SBPlayerReadyCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPlayerReadyCommand.h"

@implementation SBPlayerReadyCommand

- (id)initWithParams:(NSArray*)param {
  if (self = [super initWithParams:param]) {
    self.command = PlayerReady;
  }
  
  return self;
}

- (bool)ready {
  return [[self.params objectAtIndex:1] boolValue];
}

- (bool)startGame {
  return [[self.params objectAtIndex:2] boolValue];
}

- (bool)myTurn {
  return [[self.params objectAtIndex:3] boolValue];
}


@end
