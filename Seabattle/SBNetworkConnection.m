//
//  SBNetworkConnection.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBNetworkConnection.h"

#define HOSTADRESS @"10.0.0.7"
#define HOSTPORT 8222


@implementation SBNetworkConnection

@synthesize inputStream;
@synthesize outputStream;
@synthesize connected;
@synthesize messageReceivedCallbackSelectors;
@synthesize messageReceivedCallbackTargets;
@synthesize messageBuffer;

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
    messageBuffer = [NSMutableString stringWithCapacity:50];
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
      if (theStream == inputStream) {
        
        uint8_t buffer[1024];
        int len;
        
        while ([inputStream hasBytesAvailable]) {
          len = [inputStream read:buffer maxLength:sizeof(buffer)];
          if (len > 0) {
            
            [messageBuffer appendString:[[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding]];
            
            NSRange range;
            
            while ((range = [messageBuffer rangeOfString:LINE_BREAK]).location != NSNotFound) {
              NSString* message = [messageBuffer substringToIndex:range.location];
              
              messageBuffer = (NSMutableString*)[messageBuffer substringFromIndex:range.location + 1];
              	
              if (nil != message) {
                for (NSInteger i = 0; i < [messageReceivedCallbackTargets count]; i++) {
                  SEL selector = [[messageReceivedCallbackSelectors objectAtIndex: i] pointerValue];
                  id target = [messageReceivedCallbackTargets objectAtIndex: i];
                  [target performSelector: selector withObject:message];
                }  
                
                NSLog(@"Server said: %@", message);
              }
            }
          }
        }
      }
			break;			
      
		case NSStreamEventErrorOccurred:   
      NSLog(@"Stream error");
		case NSStreamEventEndEncountered:
      NSLog(@"Stream closed");
      [theStream close];
      [theStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
			break;
      
		default:
      if ([inputStream hasBytesAvailable]) {
        NSLog(@"Unknown event with data");
      } else {
        NSLog(@"Unknown event");
      }
			
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
