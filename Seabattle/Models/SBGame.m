//
//  SBGame.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBGame.h"

@implementation SBGame

@synthesize me;
@synthesize enemy;
@synthesize size;

static SBGame *sharedInstance = nil;

+ (SBGame *)sharedInstance {
  if (sharedInstance == nil) {
    sharedInstance = [[super alloc] init];
  }
  
  return sharedInstance;
}

- (id)init
{
  if (self = [super init]) {
    me = [[SBPlayer alloc] initMySelf];
    enemy = nil;
  }
  
  return self;
}

+ (id)alloc{
  return [self sharedInstance];
}


@end
