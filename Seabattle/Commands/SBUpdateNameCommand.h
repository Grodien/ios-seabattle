//
//  SBUpdateNameCommand.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBPlayerCommand.h"

@interface SBUpdateNameCommand : SBPlayerCommand

@property (nonatomic) NSString* name;

- (id)initWithName:(NSString*)newName;
@end
