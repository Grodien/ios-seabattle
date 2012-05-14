//
//  SBUpdateNameCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBUpdateNameCommand.h"

@implementation SBUpdateNameCommand

@synthesize name;

- (id)initWithName:(NSString*)newName {
  if (self = [super initWithType:UpdateName]) {
    name = newName;
  }
  
  return self;
}

- (NSMutableArray*)params {
  return [NSMutableArray arrayWithObject:name];
}

@end
