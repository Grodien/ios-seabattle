//
//  SBPlayerCommand.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBPlayerCommand.h"
#import "SBNetworkConnection.h"

@implementation SBPlayerCommand

@synthesize commandType;

-(id)initWithType:(PlayerCommand)type {
  if (self = [super init]) {
    commandType = type;
  }
  
  return self;
}

- (NSMutableArray *)params {
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

- (NSString*)asString {
  NSMutableString *message = [NSMutableString stringWithCapacity:30];
  [message appendFormat:@"%d",commandType];
  
  for (NSString* param in [self params]) {
    [message appendString:PARAM_SEPERATOR]; 	
    [message appendString:param];
  }
  
  [message appendString:LINE_BREAK];
  
  return message;
}

@end
