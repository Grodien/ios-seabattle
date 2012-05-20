//
//  SBFullUpdateCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBFullUpdateCommand.h"

@implementation SBFullUpdateCommand

- (id)initWithParams:(NSArray*)param {
  if (self = [super initWithParams:param]) {
    self.command = FullUpdate;
  }
  
  return self;
}

- (NSString*)fieldData {
  return [self.params objectAtIndex:1];
}

- (bool)myField {
  return [[self.params objectAtIndex:2] boolValue];
}

- (bool)myTurn {
  return [[self.params objectAtIndex:3] boolValue];
}
@end
