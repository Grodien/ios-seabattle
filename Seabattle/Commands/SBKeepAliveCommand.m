//
//  SBKeepAliveCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBKeepAliveCommand.h"

@implementation SBKeepAliveCommand

- (id)initWithParams:(NSArray*)param {
  if (self = [super initWithParams:param]) {
    self.command = KeepAlive;
  }
  
  return self;
}

@end
