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

- (id)init {
  if (self = [super init]) {
    
    int size = [SBGame size];
    
    fieldData = [NSMutableArray arrayWithCapacity:size];
    
    for (int i = 0; i < size; i++) {
      NSMutableArray *row = [NSMutableArray arrayWithCapacity:size];
      for (int j = 0; j < size; j++) {
        [row addObject:[NSNumber numberWithInt:VALUE_FREE]];
      }
      [fieldData addObject:row];
    }
  }
  
  return self;
}

- (id)initWithString:(NSString*)data {
  if (self = [super init]) {
    int size = [SBGame size];
    
    self.fieldData = [NSMutableArray arrayWithCapacity:size];
    
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
  return [[[fieldData objectAtIndex:row] objectAtIndex:col] intValue];
}

- (void)updateWithStringData:(NSString *)data {
  NSMutableArray *field = [NSMutableArray arrayWithCapacity:[SBGame size]];
  
  for (int i = 0; i < [SBGame size]; i++) {
    NSMutableArray *row = [NSMutableArray arrayWithCapacity:[SBGame size]];
    for (int j = 0; j < [SBGame size]; j++) {
      NSRange range;
      range.location = i*[SBGame size]+j;
      range.length = 1;
      [row addObject:[data substringWithRange:range]];
    }
    [field addObject:row];
  }
  
  self.fieldData = field;
}

- (void)setValue:(int)Value posX:(int)posX posY:(int)posY {
  [[self.fieldData objectAtIndex:posY] replaceObjectAtIndex:posX withObject:[NSNumber numberWithInt:Value]];
}

@end
