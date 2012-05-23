//
//  SBPartialUpdate.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPartialUpdate.h"

@implementation SBPartialUpdate

- (id)initWithParams:(NSArray*)param {
  if (self = [super initWithParams:param]) {
    self.command = PartialUpdate;
  }
  
  return self;
}

- (int)posX {
  return [[self.params objectAtIndex:1] intValue];
}

- (int)posY {
  return [[self.params objectAtIndex:2] intValue];
}

- (int)value {
  return [[self.params objectAtIndex:3] intValue];
}

- (bool)myField {
  return [[self.params objectAtIndex:4] boolValue];
}

- (bool)myTurn {
  return [[self.params objectAtIndex:5] boolValue];
}

@end
