//
//  SBPlayField.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPlayField.h"
#import "SBGame.h"

@implementation SBPlayField

@synthesize fieldData;

- (id)initWithString:(NSString*)data {
  if (self = [super init]) {
    int size = [SBGame sharedInstance].size;
    
    fieldData = [NSMutableArray arrayWithCapacity:size];
    
    for (int i = 0; i < size; i++) {
      NSMutableArray *row = [NSMutableArray arrayWithCapacity:size];
      for (int j = 0; j < size; j++) {
        NSRange range;
        range.location = i*size+j;
        range.length = 1;
        [row addObject:[data substringWithRange:range]];
      }
      [fieldData addObject:row];
    }
  }
  return self;
}

- (int)valueOfColumn:(int)col row:(int)row {
  return [[[fieldData objectAtIndex:col] objectAtIndex:row] intValue];
}

@end
