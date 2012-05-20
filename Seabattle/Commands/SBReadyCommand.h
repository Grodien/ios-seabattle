//
//  SBReadyComamnd.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPlayerCommand.h"

@interface SBReadyCommand : SBPlayerCommand

@property (nonatomic) bool ready;

- (id)initWithReadyState:(bool)state;

@end
