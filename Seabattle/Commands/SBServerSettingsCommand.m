//
//  SBServerSettingsCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBServerSettingsCommand.h"

@implementation SBServerSettingsCommand

- (id)initWithParams:(NSArray*)param {
  if (self = [super initWithParams:param]) {
    self.command = ServerSettings;
  }
  
  return self;
}

- (int)SIZE {
  return [[self.params objectAtIndex:1] intValue];
}
- (int) SMALL_SHIP_COUNT {
  return [[self.params objectAtIndex:2] intValue];
}
- (int) MEDIUM_SHIP_COUNT {
  return [[self.params objectAtIndex:3] intValue];
}
- (int) BIG_SHIP_COUNT {
  return [[self.params objectAtIndex:4] intValue];
}
- (int) HUGE_SHIP_COUNT {
  return [[self.params objectAtIndex:5] intValue];
}
- (int) ULTIMATE_SHIP_COUNT {
  return [[self.params objectAtIndex:6] intValue];
}

@end
