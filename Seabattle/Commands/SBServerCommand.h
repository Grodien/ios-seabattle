//
//  SBServerCommand.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBCommand.h"

@interface SBServerCommand : NSObject

@property (nonatomic) ServerCommand command;
@property (nonatomic, strong) NSArray* params;

- (id)initWithParams:(NSArray*)param;

@end
