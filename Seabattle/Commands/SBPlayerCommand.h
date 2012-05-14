//
//  SBPlayerCommand.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBCommand.h"

@interface SBPlayerCommand : NSObject

@property (nonatomic) PlayerCommand commandType;

- (NSMutableArray*)params;
- (NSString*)asString;
- (id)initWithType:(PlayerCommand)type;

@end
