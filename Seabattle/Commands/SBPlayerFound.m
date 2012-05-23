//
//  SBPlayerFound.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPlayerFound.h"

@implementation SBPlayerFound

- (id)initWithParams:(NSArray *)param {
  if (self = [super initWithParams:param]) {
    self.command = PlayerFound;
  }
  
  return self;
}

- (NSString*)playerName {
  return [self.params objectAtIndex:1];
}

@end
