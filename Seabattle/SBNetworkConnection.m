//
//  SBNetworkConnection.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBNetworkConnection.h"

#define HOSTADRESS @"10.3.112.235"
#define HOSTPORT 8222

@implementation SBNetworkConnection

@synthesize inputStream;
@synthesize outputStream;
@synthesize connected;
@synthesize messageReceivedCallbackSelectors;
@synthesize messageReceivedCallbackTargets;

static SBNetworkConnection *sharedInstance = nil;

+ (SBNetworkConnection *)sharedInstance {
  if (sharedInstance == nil) {
    sharedInstance = [[super alloc] init];
  }
  
  return sharedInstance;
}

- (id)init
{
  if (self = [super init]) {
    inputStream = nil;
    outputStream = nil;
    connected = NO;
  }
  
  return self;
}

+ (id)alloc{
  return [self sharedInstance];
}

- (void)connect {
  CFReadStreamRef readStream;
  CFWriteStreamRef writeStream;
  CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)HOSTADRESS, HOSTPORT, &readStream, &writeStream);
  inputStream = (__bridge NSInputStream *)readStream;
  outputStream = (__bridge NSOutputStream *)writeStream;
  
  [inputStream setDelegate:self];
  [outputStream setDelegate:self];
  
  [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
  [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
  
  [inputStream open];
  [outputStream open];
}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
  
	switch (streamEvent) {
      
		case NSStreamEventOpenCompleted:
      connected = YES;
			NSLog(@"Stream opened");
			break;
      
		case NSStreamEventHasBytesAvailable:
			break;			
      
		case NSStreamEventErrorOccurred:   
      NSLog(@"Stream error");
		case NSStreamEventEndEncountered:
      NSLog(@"Stream closed");
      [theStream close];
      [theStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
			break;
      
		default:
			NSLog(@"Unknown event");
	}
  
}

- (void)subscribeMessageReceived:(id)obj withSelector:(SEL)selector {
  [messageReceivedCallbackTargets addObject: obj];
  [messageReceivedCallbackSelectors addObject: [NSValue valueWithPointer: selector]];
}

- (void)unsubscribeMessageReceived:(id)obj withSelector:(SEL)selector {
  for (NSInteger i = 0; i < [messageReceivedCallbackTargets count]; i++) {
    if (([messageReceivedCallbackTargets objectAtIndex:i] == obj) &&
        ([[messageReceivedCallbackSelectors objectAtIndex:i] pointerValue] == selector)) {
      [messageReceivedCallbackTargets removeObjectAtIndex: i];
      [messageReceivedCallbackSelectors removeObjectAtIndex: i];
    }
  }
}

@end
