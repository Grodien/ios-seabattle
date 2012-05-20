//
//  SBGame.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBPlayer.h"

@interface SBGame : NSObject

@property (strong, nonatomic) SBPlayer* me;
@property (strong, nonatomic) SBPlayer* enemy;

+ (SBGame *)sharedInstance;
+ (int)size;
+ (void)size:(int)s;
@end
