//
//  SBPlayField.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define VALUE_FREE 0
#define VALUE_SHIP = 1
#define VALUE_FREE_HIT = 2
#define VALUE_SHIP_HIT = 3

@interface SBPlayField : NSObject

@property (nonatomic) NSMutableArray *fieldData;

- (id)initWithString:(NSString*)data;
- (int)valueOfColumn:(int)col row:(int)row;
@end
