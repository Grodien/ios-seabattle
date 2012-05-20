//
//  SBPlayerShoot.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPlayerShoot.h"

@implementation SBPlayerShoot

@synthesize posX, posY;

- (id)initWithPosX:(int)x PosY:(int)y {
  if (self = [super initWithType:PlayerShoot]) {
    posX = x;
    posY = y; 
  }
  return self;
}

- (NSMutableArray*)params {
  return [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:posX], [NSNumber numberWithInt:posY], nil];
}

@end
