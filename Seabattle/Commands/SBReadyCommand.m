//
//  SBReadyComamnd.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBReadyCommand.h"

@implementation SBReadyCommand

@synthesize ready;

- (id)init {
  if (self = [super initWithType:Ready]) {
    ready = NO;
  }
  return self;
}

- (id)initWithReadyState:(bool)state {
  if (self = [super initWithType:Ready]) {
    ready = state;
  }
  return self;
}

- (NSMutableArray*)params {
  return [NSMutableArray arrayWithObject:[NSString stringWithFormat:@"%d", ready]];
}

@end
