//
//  SBPlayer.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPlayer.h"

@implementation SBPlayer

@synthesize name;
@synthesize playField;

- (id)initMySelf {
  if (self = [super init]) {
    name = @"Thomas";
    //TODO: load NSUserDefaults
  }
  return self;
}

@end
