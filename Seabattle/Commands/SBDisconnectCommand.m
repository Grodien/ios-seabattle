//
//  SBDisconnectCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBDisconnectCommand.h"

@implementation SBDisconnectCommand
- (id)init {
  if (self = [super initWithType:Disconnect]) {
    
  }
  
  return self;
}

- (NSMutableArray*)params {
  return [NSMutableArray arrayWithCapacity:0];
}

@end
