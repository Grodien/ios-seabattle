//
//  SBOnlineBattleConnection.m
//  Seabattle
//
//  Created by remo blättler on 16.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBOnlineBattleConnection.h"

#define HOSTADRESS @"10.3.112.235"
#define HOSTPORT 8222

@implementation SBOnlineBattleConnection

@synthesize inputStream;
@synthesize outputStream;

- (void)initNetworkCommunication {
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

static SBOnlineBattleConnection* singleton; 
+(SBOnlineBattleConnection*) sharedSBOnlineBattleConnection {
    if (!singleton) {
        singleton = [[SBOnlineBattleConnection alloc] init];
    }
    return singleton;
}

@end
