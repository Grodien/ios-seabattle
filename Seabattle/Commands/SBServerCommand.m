//
//  SBServerCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBServerCommand.h"

@implementation SBServerCommand

@synthesize command;
@synthesize params;

- (id)initWithParams:(NSArray*)param {
  if (self = [super init]) {
    params = param;
  }
  
  return self;
}

@end
