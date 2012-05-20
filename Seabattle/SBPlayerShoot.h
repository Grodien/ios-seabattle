//
//  SBPlayerShoot.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPlayerCommand.h"

@interface SBPlayerShoot : SBPlayerCommand
@property (nonatomic) int posX;
@property (nonatomic) int posY;

- (id)initWithPosX:(int)x PosY:(int)y;

@end
