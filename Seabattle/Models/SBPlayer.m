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
@synthesize ready;

- (id)initWithName:(NSString*)pName {
  if (self = [super init]) {
      
    name = pName;
    playField = [[SBPlayField alloc] init];
    ready = false;
  }
  return self;
}

- (id)initMySelf {
  return [self initWithName:@"Thomas"];
}

- (id)initWithUserDefault {
    NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
    return [self initWithName:[usernameDefault stringForKey:@"Username"]];
}  

@end
