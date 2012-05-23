//
//  SBWinCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBWinCommand.h"

@implementation SBWinCommand

- (id)initWithParams:(NSArray*)param {
  if (self = [super initWithParams:param]) {
    self.command = Win;
  }
  
  return self;
}

- (bool)win {
  return [[self.params objectAtIndex:1] boolValue];
}

@end
