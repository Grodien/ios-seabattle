//
//  SBUser.m
//  Seabattle
//
//  Created by remo blättler on 16.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBUser.h"

@implementation SBUser

@synthesize username;
@synthesize wins;
@synthesize losses;

static SBUser* singleton; 
+(SBUser*) sharedSBUser {
    if (!singleton) {
        singleton = [[SBUser alloc] init];
    }
    return singleton;
}

@end
