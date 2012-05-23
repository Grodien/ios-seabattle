//
//  SBFullUpdateCommand.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBServerCommand.h"

@interface SBFullUpdateCommand : SBServerCommand

@property (nonatomic, readonly) NSString* fieldData;
@property (nonatomic, readonly) bool myField;
@property (nonatomic, readonly) bool myTurn;

@end
