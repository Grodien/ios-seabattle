//
//  SBErrorCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBErrorCommand.h"

@implementation SBErrorCommand
- (id)initWithParams:(NSArray*)param {
  if (self = [super initWithParams:param]) {
    self.command = Error;
  }
  
  return self;
}

- (int)errorCode {
  return [[self.params objectAtIndex:1] intValue];
}
@end
